//
//  Tag.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 11/13/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit

class Tag: NSObject {

    var tagId:Int?
    var phrase:String?
    var isFromGettyImages:Bool?
    
    init(id:Int, isFromGetty:Bool) {
        tagId = id
        isFromGettyImages = isFromGetty
    }
    
    init(tagPhrase:String) {
        phrase = tagPhrase
    }
}
