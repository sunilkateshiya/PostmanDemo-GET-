//
//  ModelClasses.swift
//  PostManDemos
//
//  Created by iFlame on 6/17/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import Foundation

class ModelGetResponse{

    /*"{\"args\":{\"test\":\"123\"},\"headers\":{\"host\":\"postman-echo.com\",\"accept\":\"* / *\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-us\",\"cache-control\":\"no-cache\",\"postman-token\":\"3ade654f-a94a-156d-d4d1-4fa8517e55da\",\"user-agent\":\"PostManDemos/1 CFNetwork/811.4.18 Darwin/16.5.0\",\"x-forwarded-port\":\"443\",\"x-forwarded-proto\":\"https\"},\"url\":\"https://postman-echo.com/get?test=123\"}"
    */
 
    var args : [String :Any]?
    var headers : [String :Any]?
    var url : String?
    
    init() {
        
    }
    
    init(dictionary : [String : Any]) {
        
        if let args = dictionary["args"] as? [String :Any]{
            self.args = args
        }
        if let headers = dictionary["headers"] as? [String :Any]{
            self.headers = headers
        }
        if let url = dictionary["url"] as? String{
            self.url = url
        }
    }
    
    func updateWithDictionary(dictionary : [String : Any]) {
        
        if let args = dictionary["args"] as? [String :Any]{
            self.args = args
        }
        if let headers = dictionary["headers"] as? [String :Any]{
            self.headers = headers
        }
        if let url = dictionary["url"] as? String{
            self.url = url
        }
    }
 
}
