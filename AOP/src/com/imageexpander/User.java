package com.imageexpander;

import java.util.ArrayList;
import java.util.List;

public class User {
	
	private Integer userId;
	private String fbUserName;
//	private List<ImageCollection> imageCollections;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getFbUserName() {
		System.out.println("Facebook user name get: " + fbUserName);
		return fbUserName;
	}
	public void setFbUserName(String fbUserName) {
		System.out.println("Facebook user name set: " + fbUserName);
		this.fbUserName = fbUserName;
	}
//	public List<ImageCollection> getImageCollections() {
//		return imageCollections;
//	}
//	private void setImageCollections(List<ImageCollection> imageCollections) {
//		this.imageCollections = imageCollections;
//	}
//	
//	public void addImageCollection(ImageCollection imgCllt) {
//		this.imageCollections.add(imgCllt);
//	}
	
//	public void addToImageCollection(ImageCollection collection, Image img) {
//		Integer imageCollectionId = imageCollections.indexOf(collection);
//		ImageCollection imageCollection = imageCollections.get(imageCollectionId);
//		imageCollection.addToImageCollection(img);
//	}
//	
//	public void addToImageCollection(ImageCollection collection, List<Image> img) {
//		Integer imageCollectionId = imageCollections.indexOf(collection);
//		ImageCollection imageCollection = imageCollections.get(imageCollectionId);
//		imageCollection.addToImageCollection(img);
//	}
	
//	public User() {
//		imageCollections = new ArrayList<ImageCollection>();
//	}

}