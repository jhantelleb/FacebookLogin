//
//  ProfileModel.swift
//  DatePlayCodingExercise
//
//  Created by Jhantelle Belleza on 8/31/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation

struct ProfileModel {
    
    var email: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var profileImage: String = "" //Photo Image Link
    
    init() { }
    
    init(email: String, firstName: String, lastName: String, profileImage: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.profileImage = profileImage
    }
}
