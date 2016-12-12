package com.imageexpander;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ImageMapper implements RowMapper<Image> {

	public Image mapRow(ResultSet rs, int rowNum) throws SQLException {
	      Image image = new Image();
	      image.setImageId(rs.getInt("id"));
	      image.setDescription(rs.getString("description"));
	      image.setFlickrSize(rs.getString("flickrSize"));
	      image.setFromApi(rs.getBoolean("fromApi"));
	      image.setGettyLocation(rs.getString("gettyLocation"));
	      image.setGettySize(rs.getString("gettySize"));
	      image.setMainColor(rs.getString("mainColor"));
	      image.setTitle(rs.getString("title"));
	      image.setUri(rs.getString("uri"));
	      return image;
	   }
}
