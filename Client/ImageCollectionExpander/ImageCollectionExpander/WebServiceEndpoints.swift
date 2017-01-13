//
//  WebServiceEndpoints.swift
//  ImageCollectionExpander
//
//  Created by Bianca Tiba on 1/12/17.
//  Copyright © 2017 Bianca Madalina Tiba. All rights reserved.
//

import Foundation

let RootUrl = ""

enum WebServiceEndpoints {
    case APIGetAlbums
    case APIGetPhotos
    case APIAddPhoto
    case APIAddAlbum
    
    static private let apiPaths = [
        APIGetAlbums: "/",
        APIGetPhotos: "/",
        APIAddPhoto: "/",
        APIAddAlbum: "/"
        ]
    
    func fullPath() -> String {
        return RootUrl + WebServiceEndpoints.apiPaths[self]!
    }
}
