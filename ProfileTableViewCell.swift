//
//  ProfileTableViewCell.swift
//  DatePlayCodingExercise
//
//  Created by Jhantelle Belleza on 8/31/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit

final class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageview: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageview.layer.cornerRadius =  4
        profileImageview.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

