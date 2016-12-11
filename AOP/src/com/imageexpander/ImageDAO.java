package com.imageexpander;

import java.util.List;

import javax.sql.DataSource;

public interface ImageDAO {

	/** 
	    * This is the method to be used to initialize
	    * database resources ie. connection.
	    */
	   public void setDataSource(DataSource ds);
	   /** 
	    * This is the method to be used to create
	    * a record in the Student table.
	    */
	   public void create(String description, Boolean fromApi, String title,String uri);
	   /** 
	    * This is the method to be used to list down
	    * a record from the Student table corresponding
	    * to a passed student id.
	    */
	   public Image getImage(Integer id);
	   /** 
	    * This is the method to be used to list down
	    * all the records from the Student table.
	    */
	   public List<Image> listImages();
	   /** 
	    * This is the method to be used to delete
	    * a record from the Student table corresponding
	    * to a passed student id.
	    */
	   public void delete(Integer id);
	   /** 
	    * This is the method to be used to update
	    * a record into the Student table.
	    */
	   public void updateFlickrSize(Integer id, String flickrSize);
	   public void updateGettyLocation(Integer id, String gettyLocation);
	   public void updateGettySize(Integer id, String gettySize);
	   public void updateMainColor(Integer id, String mainColor);
	   
	   
}
