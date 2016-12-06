package com.imageexpander;

import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Component
public class UserJDBCTemplate implements UserDAO {
	
	private static Logger logger = Logger.getLogger(UserAdvice.class);

	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	@Transactional
	public void create(String fbUserName) {
		String SQL = "insert into User (fbusername) values ( ? )";

		jdbcTemplateObject.update(SQL, fbUserName);
		logger.info("Created User with name: " + fbUserName);
		System.out.println("Created Record Name = " + fbUserName);
		return;
	}

	@Transactional
	@Cacheable(value="users", key="#id")
	public User getUser(Integer id) {
		String SQL = "select * from User where id = ?";
		User student = jdbcTemplateObject.queryForObject(SQL, new Object[] { id }, new UserMapper());
		return student;
	}

	@Transactional
	@Cacheable(value="allUsers")
	public List<User> listUsers() {
		String SQL = "select * from User";
		List<User> users = jdbcTemplateObject.query(SQL, new UserMapper());
		return users;
	}

	@Transactional
	public void delete(Integer id) {
		String SQL = "delete from User where id = ?";
		jdbcTemplateObject.update(SQL, id);
		System.out.println("Deleted Record with ID = " + id);
		return;
	}

	@Transactional
	public void update(Integer id, String fbUserName) {
		String SQL = "update User set fbusername = ? where id = ?";
		jdbcTemplateObject.update(SQL, fbUserName, id);
		System.out.println("Updated Record with ID = " + id);
		return;
	}
}
