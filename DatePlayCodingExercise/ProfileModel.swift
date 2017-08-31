//
//  ProfileModel.swift
//  DatePlayCodingExercise
//
//  Created by Jhantelle Belleza on 8/31/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

struct ProfileModel {
    
    var email: String
    var firstName: String
    var lastName: String
    var imageURL: String    
    var profileImage: UIImageView {
        let imageView = UIImageView()
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFit
        imageView.sd_setImage(with: URL(string: imageURL))
        return imageView
    }
    
    init(email: String, firstName: String, lastName: String, imageURL: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.imageURL = imageURL
    }
}
