//
//  RequestBuilder.swift
//  ImageCollectionExpander
//
//  Created by Bianca Tiba on 1/12/17.
//  Copyright © 2017 Bianca Madalina Tiba. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public enum HTTPStatus:Int {
    case HTTPStatusOK = 200
    case HTTPStatusCreated = 201
    case HTTPStatusNoContent = 204
    case HTTPStatusBadRequest = 400
    case HTTPStatusResourceExists = 403
    case HTTPStatusNotFound = 404
    case HTTPStatusRequestTimeout = 408
    case HTTPStatusInternalServerError = 500
    case HTTPStatusNotImplemented = 501
    case HTTPStatusBadGateway = 502
    case HTTPStatusServiceUnavailable = 503
    case HTTPStatusGatewayTimeout = 504
    case HTTPStatusOtherError = 999
}

let webServiceErrorDomain = "ImageCollectionExpanderErrorDomain"

struct HTTPErrors {
    static let serviceErrorBadRequest = "Bad Request"
    static let serviceErrorNotFound = "Not Found"
    static let serviceErrorRequestTimeout = "Request Timeout"
    static let serviceErrorInternalServerError = "Internal Server Error"
    static let serviceErrorResourceExists = "Resource already exists"
    static let serviceErrorNotImplemented = "Not Implemented"
    static let serviceErrorBadGateway = "Bad Gateway"
    static let serviceErrorServiceUnavailable = "Service Unavailable"
    static let serviceErrorGatewayTimeout = "Gateway Timeout"
    static let serviceErrorOtherError = "Other Error"
}

public enum iExpanderHTTPMethod: String {
    case GET = "GET"
    case HEAD = "HEAD"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
    case OPTIONS = "OPTIONS"
}


class RequestBuilder: NSObject {
    
    func request(url: String, method:iExpanderHTTPMethod, parameters: [String : AnyObject]?, headers:[String : String]?, completion: @escaping (_ responseData: JSON?, _ status: (succeeded:Bool, error:NSError?)) -> Void) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let methodName:Alamofire.HTTPMethod = alamofireHttpMethod(method: method)
        
        Alamofire.request(url, method: methodName, parameters: parameters, encoding: URLEncoding.default, headers: headers).response { response in
                    
            if response != nil {
                
                let responseStatus = self.checkResponse(response: response.response!)
                
                if responseStatus.succeeded == true {
                    
                    if let responseData = response.data {
                        let json = JSON(data:responseData)
                        
                        completion(json, responseStatus)
                    } else {
                        completion(nil, responseStatus)
                    }
                } else {
                    
                    completion(nil, responseStatus)
                }
            } else {
                let succeeded:Bool = false
                let error:NSError = NSError(domain: webServiceErrorDomain, code: HTTPStatus.HTTPStatusOtherError.rawValue, userInfo: [NSLocalizedDescriptionKey : "No response!"])
                
                completion(nil, (succeeded, error))
            }
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        }
    }
    
    private func alamofireHttpMethod(method:iExpanderHTTPMethod) -> Alamofire.HTTPMethod {
        var httpMethod:Alamofire.HTTPMethod
        
        switch method {
        case iExpanderHTTPMethod.GET:
            httpMethod = Alamofire.HTTPMethod.get
        case iExpanderHTTPMethod.POST:
            httpMethod = Alamofire.HTTPMethod.post
        case iExpanderHTTPMethod.PUT:
            httpMethod = Alamofire.HTTPMethod.put
        case iExpanderHTTPMethod.DELETE:
            httpMethod = Alamofire.HTTPMethod.delete
        case iExpanderHTTPMethod.OPTIONS:
            httpMethod = Alamofire.HTTPMethod.options
        default:
            httpMethod = Alamofire.HTTPMethod.head
        }
        
        return httpMethod
    }
    
    private func checkResponse(response: HTTPURLResponse) -> (succeeded:Bool, error:NSError?) {
        var succeeded:Bool = false
        var error:NSError?
        
        switch response.statusCode {
        case HTTPStatus.HTTPStatusOK.rawValue, HTTPStatus.HTTPStatusCreated.rawValue, HTTPStatus.HTTPStatusNoContent.rawValue:
            succeeded = true
            break
            
        case HTTPStatus.HTTPStatusBadGateway.rawValue:
            error = NSError(domain: webServiceErrorDomain, code: HTTPStatus.HTTPStatusBadGateway.rawValue, userInfo: [NSLocalizedDescriptionKey : response.url!.absoluteString+" -> "+HTTPErrors.serviceErrorBadGateway])
            break
            
        case HTTPStatus.HTTPStatusBadRequest.rawValue:
            error = NSError(domain: webServiceErrorDomain, code: HTTPStatus.HTTPStatusBadRequest.rawValue, userInfo: [NSLocalizedDescriptionKey : response.url!.absoluteString+" -> "+HTTPErrors.serviceErrorBadRequest])
            break
            
        case HTTPStatus.HTTPStatusGatewayTimeout.rawValue:
            error = NSError(domain: webServiceErrorDomain, code: HTTPStatus.HTTPStatusGatewayTimeout.rawValue, userInfo: [NSLocalizedDescriptionKey : response.url!.absoluteString+" -> "+HTTPErrors.serviceErrorGatewayTimeout])
            break
            
        case HTTPStatus.HTTPStatusInternalServerError.rawValue:
            error = NSError(domain: webServiceErrorDomain, code: HTTPStatus.HTTPStatusInternalServerError.rawValue, userInfo: [NSLocalizedDescriptionKey : response.url!.absoluteString+" -> "+HTTPErrors.serviceErrorInternalServerError])
            break
            
        case HTTPStatus.HTTPStatusNotFound.rawValue:
            error = NSError(domain: webServiceErrorDomain, code: HTTPStatus.HTTPStatusNotFound.rawValue, userInfo: [NSLocalizedDescriptionKey : response.url!.absoluteString+" -> "+HTTPErrors.serviceErrorNotFound])
            break
            
        case HTTPStatus.HTTPStatusNotImplemented.rawValue:
            error = NSError(domain: webServiceErrorDomain, code: HTTPStatus.HTTPStatusNotImplemented.rawValue, userInfo: [NSLocalizedDescriptionKey : response.url!.absoluteString+" -> "+HTTPErrors.serviceErrorNotImplemented])
            break
            
        case HTTPStatus.HTTPStatusRequestTimeout.rawValue:
            error = NSError(domain: webServiceErrorDomain, code: HTTPStatus.HTTPStatusRequestTimeout.rawValue, userInfo: [NSLocalizedDescriptionKey : response.url!.absoluteString+" -> "+HTTPErrors.serviceErrorRequestTimeout])
            break
            
        case HTTPStatus.HTTPStatusServiceUnavailable.rawValue:
            error = NSError(domain: webServiceErrorDomain, code: HTTPStatus.HTTPStatusServiceUnavailable.rawValue, userInfo: [NSLocalizedDescriptionKey : response.url!.absoluteString+" -> "+HTTPErrors.serviceErrorServiceUnavailable])
            break
            
        case HTTPStatus.HTTPStatusResourceExists.rawValue:
            error = NSError(domain: webServiceErrorDomain, code: HTTPStatus.HTTPStatusResourceExists.rawValue, userInfo: [NSLocalizedDescriptionKey : response.url!.absoluteString+" -> "+HTTPErrors.serviceErrorResourceExists])
            break
            
        default:
            error = NSError(domain: webServiceErrorDomain, code: HTTPStatus.HTTPStatusOtherError.rawValue, userInfo: [NSLocalizedDescriptionKey : response.url!.absoluteString+" -> \(response.statusCode)"])
            break
        }
        
        return (succeeded, error)
    }
}
