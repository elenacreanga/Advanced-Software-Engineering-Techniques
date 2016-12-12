package com.imageexpander;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class UserJDBCTemplate implements UserDAO {

	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public void create(String fbUserName) {
		String SQL = "insert into User (fbusername) values ( ? )";

		jdbcTemplateObject.update(SQL, fbUserName);
		System.out.println("Created Record Name = " + fbUserName);
		return;
	}

	public User getUser(Integer id) {
		String SQL = "select * from User where id = ?";
		User student = jdbcTemplateObject.queryForObject(SQL, new Object[] { id }, new UserMapper());
		return student;
	}

	public List<User> listUsers() {
		String SQL = "select * from User";
		List<User> users = jdbcTemplateObject.query(SQL, new UserMapper());
		return users;
	}

	public void delete(Integer id) {
		String SQL = "delete from User where id = ?";
		jdbcTemplateObject.update(SQL, id);
		System.out.println("Deleted Record with ID = " + id);
		return;
	}

	public void update(Integer id, String fbUserName) {
		String SQL = "update User set fbusername = ? where id = ?";
		jdbcTemplateObject.update(SQL, fbUserName, id);
		System.out.println("Updated Record with ID = " + id);
		return;
	}
}
