//
//  Constants.swift
//  DatePlayCodingExercise
//
//  Created by Jhantelle Belleza on 8/31/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import FacebookCore

class Constants {
    
    static let readPermissions: [ReadPermission] = [.publicProfile, .email]
    static let graphParameter: [String: Any] = ["fields": "id, first_name, last_name, email, picture.type(large)"]
}
