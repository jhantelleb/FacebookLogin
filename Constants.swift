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
    
    //MARK: Constants - SDK
    static let readPermissions: [ReadPermission] = [.publicProfile, .email]
    static let graphParameter: [String: Any] = ["fields": "id, first_name, last_name, email, picture.type(large)"]
    
    //MARK: Constants - Table View Cell and Table View Controller
    static let xibName = "ProfileTableViewCell"
    static let reuseIdentifier = "displayDetail"
}
