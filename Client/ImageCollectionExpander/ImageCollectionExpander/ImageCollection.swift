//
//  ImageCollection.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 11/13/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit

protocol ImageCollectionDelegate: class {
    func didAddTag(tag:Tag)
    func didRemoveTag(tagId:Int)
}

class ImageCollection: NSObject {
    
    var collectionId:Int
    var images:Array<Image>
    var tags:Array<Tag>
    var name:String

    init(id:Int, imagesArray:Array<Image>, mainTags:Array<Tag>, collectionName:String) {
        collectionId = id
        images = imagesArray
        tags = mainTags
        name = collectionName
    }
    
    func addImage(image:Image) {
        
    }
    
    func removeImage(imageId:Int) {
        
    }
    
    func addTag(tag:Tag) {
        
    }
    
    func removeTag(tagId:Int) {
        
    }
}
