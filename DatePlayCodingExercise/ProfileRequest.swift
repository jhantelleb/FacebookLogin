//
//  ProfileRequest.swift
//  DatePlayCodingExercise
//
//  Created by Jhantelle Belleza on 8/30/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import FacebookCore

struct ProfileRequest: GraphRequestProtocol {
    
    struct Response: GraphResponseProtocol {
        init(rawResponse: Any?) {
            print(rawResponse!)
        }
    }
    
    var graphPath = "/me"
    var parameters: [String : Any]? = ["fields": "id, name"]
    var accessToken = AccessToken.current
    var httpMethod: GraphRequestHTTPMethod = .GET
    var apiVersion: GraphAPIVersion = .defaultVersion
    
}
