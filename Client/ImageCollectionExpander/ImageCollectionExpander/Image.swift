//
//  Image.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 11/13/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit
import CoreLocation

class Image: NSObject {

    var imageId:Int
    var shortDescription: String?
    var flickrLocation:CLLocation?
    var flickrSize:String?
    var isFromApi:Bool?
    var gettyLocation:String?
    var gettySize:String?
    var mainColor:String?
    var tags:Array<Tag>?
    var title:String?
    var uri:String?
    
    weak var delegate:ImageCollectionDelegate?
    
    init(id:Int, description:String?, flickrLoc:CLLocation?, imageFlickrSize:String?, fromApi:Bool?,
         gettyLoc:String?, imageGettySize:String?, imageColor:String?, imageTags:Array<Tag>?, imageTitle:String, imageUri:String?) {
        imageId = id
        shortDescription = description
        flickrLocation = flickrLoc
        flickrSize = imageFlickrSize
        isFromApi = fromApi
        gettyLocation = gettyLoc
        gettySize = imageGettySize
        mainColor = imageColor
        tags = imageTags
        title = imageTitle
        uri = imageUri
    }
    
    func addTag(tag:Tag) {
        delegate?.didAddTag(tag: tag)
    }
    
    func removeTag(tagId:Int) {
        delegate?.didRemoveTag(tagId: tagId)
    }
}
