package com.imageexpander;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class ImageJDBCTemplate implements ImageDAO {

	private DataSource dataSource;
	   private JdbcTemplate jdbcTemplateObject;
	   
	   public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	   }

	@Override
	public void create(String description, Boolean fromApi, String title, String uri) {
		String SQL = "insert into Image (description, fromapi, title, uri) values ( ?, ?, ?, ? )";
	      
	      jdbcTemplateObject.update( SQL, description, fromApi, title, uri);
	      System.out.println("Created Record Name = " + description + " " + fromApi + " " + title + " " + uri);
	      return;
	    }  

	@Override
	public Image getImage(Integer id) {
		String SQL = "select * from Image where id = ?";
	      Image image = jdbcTemplateObject.queryForObject(SQL, 
	                        new Object[]{id}, new ImageMapper());
	      return image;
	}

	@Override
	public List<Image> listImages() {
		 String SQL = "select * from Image";
	      List <Image> images = jdbcTemplateObject.query(SQL, 
	                                new ImageMapper());
	      return images;
	}

	@Override
	public void delete(Integer id) {
		String SQL = "delete from Image where id = ?";
	      jdbcTemplateObject.update(SQL, id);
	      System.out.println("Deleted Record with ID = " + id );
	      return;
		
	}

	@Override
	public void updateFlickrSize(Integer id, String flickrSize) {
		 String SQL = "update Image set flickrsize = ? where id = ?";
	      jdbcTemplateObject.update(SQL, flickrSize, id);
	      System.out.println("Updated Record with ID = " + id );
	      return;
	}

	@Override
	public void updateGettyLocation(Integer id, String gettyLocation) {
		 String SQL = "update User set gettylcation = ? where id = ?";
	      jdbcTemplateObject.update(SQL, gettyLocation, id);
	      System.out.println("Updated Record with ID = " + id );
	      return;
	}

	@Override
	public void updateGettySize(Integer id, String gettySize) {
		 String SQL = "update Image set gettysize = ? where id = ?";
	      jdbcTemplateObject.update(SQL, gettySize, id);
	      System.out.println("Updated Record with ID = " + id );
	      return;
	}

	@Override
	public void updateMainColor(Integer id, String mainColor) {
		 String SQL = "update Image set maincolor = ? where id = ?";
	      jdbcTemplateObject.update(SQL, mainColor, id);
	      System.out.println("Updated Record with ID = " + id );
	      return;		
	}

}
