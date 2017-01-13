//
//  WebService.swift
//  ImageCollectionExpander
//
//  Created by Bianca Tiba on 1/12/17.
//  Copyright © 2017 Bianca Madalina Tiba. All rights reserved.
//

import Foundation
import SwiftyJSON

class WebService: NSObject {
    
    private let requestBuilder = RequestBuilder()
    
    func getAlbums(username:String, completion: @escaping (_ responseData: JSON?, _ status: (succeeded:Bool, error:NSError?)) -> Void) {
        let requestUrl = WebServiceEndpoints.APIGetAlbums.fullPath() + "?" + "username=" + username
        
        requestBuilder.request(url: requestUrl, method: .GET, parameters: nil, headers: nil) { (responseData, status : (succeeded: Bool, error: NSError?)) in
            completion(responseData, status)
        }
    }
    
    func getPhotos(albumId:String, completion: @escaping (_ responseData: JSON?, _ status: (succeeded:Bool, error:NSError?)) -> Void) {
        let requestUrl = WebServiceEndpoints.APIGetPhotos.fullPath() + "?" + "albumId=" + albumId
        
        requestBuilder.request(url: requestUrl, method: .GET, parameters: nil, headers: nil) { (responseData, status : (succeeded: Bool, error: NSError?)) in
            completion(responseData, status)
        }//0-9 a-z A-Z 1-5
    }
}
