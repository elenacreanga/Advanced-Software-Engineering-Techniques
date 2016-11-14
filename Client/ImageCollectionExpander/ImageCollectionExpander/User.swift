//
//  User.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 11/13/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit

class User: NSObject {
    
    static let sharedInstance = User()
    
    var fbId:String?
    var imageCollections:Array<ImageCollection>?
    var name:String?
    
    override init() {
    }
    
    init(facebookId:String, userName:String) {
        fbId = facebookId
        imageCollections  = Array<ImageCollection>()
        name = userName
    }
    
    func addImageCollection(collection:ImageCollection) {
        imageCollections?.append(collection)
    }
    
    func addImageToCollection(collectionId:Int, image:Image) {

    }
    
    func removeImageFromCollection(collectionId:Int, image:Image) {
        
    }

    func removeICollection(collectionId:Int) {
        
    }
}
