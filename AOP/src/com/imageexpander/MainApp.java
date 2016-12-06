package com.imageexpander;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {
	
	static Logger log = Logger.getLogger(MainApp.class.getName());

	public static void main(String[] args) {
	   
      ApplicationContext context = 
             new ClassPathXmlApplicationContext("Beans.xml");
      
      log.info("Going to create user jdbc template object");
      
      UserJDBCTemplate userJDBCTemplate = (UserJDBCTemplate) context.getBean("userJDBCTemplate");
      ImageJDBCTemplate imageJDBCTemplate = (ImageJDBCTemplate) context.getBean("imageJDBCTemplate");
      
      System.out.println("------User Records Creation--------" );
      userJDBCTemplate.create("Gabriela1");
      userJDBCTemplate.create("Elena1");
      userJDBCTemplate.create("Bianca1");
      userJDBCTemplate.create("Isabela1");

      System.out.println("------Listing User Multiple Records--------" );
      List<User> users = userJDBCTemplate.listUsers();
      for (User user : users) {
    	  System.out.println("ID : " + user.getUserId() );
          System.out.println(", Name : " + user.getFbUserName() );
      }
      
      System.out.println("------Image Records Creation--------" );
      imageJDBCTemplate.create("first image", false, "sunflower", "http://sunflower.com");
      imageJDBCTemplate.create("second image", false, "apple", "http://apple.com");
      
      System.out.println("------Listing Image Multiple Records--------" );
      List<Image> images = imageJDBCTemplate.listImages();
      for (Image image : images) {
    	  System.out.println("ID : " + image.getImageId() );
          System.out.println(", Name : " + image.getDescription() );
      }

      log.info("Exiting the program");
	  
   }
}