package com.imageexpander;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UserMapper implements RowMapper<User>{
	
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
	      User user = new User();
	      user.setUserId(rs.getInt("id"));
	      user.setFbUserName(rs.getString("fbUserName"));
	      return user;
	   }

}
