//
//  ViewController.swift
//  DatePlayCodingExercise
//
//  Created by Jhantelle Belleza on 8/30/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import FacebookLogin

class FacebookViewController: UIViewController {
    
    var userProfile: ProfileModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = LoginButton(readPermissions: Constants.readPermissions)
        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension FacebookViewController: LoginButtonDelegate {
    //MARK: Facebook Login
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("Log Out Pressed")
    }
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        print("Login Result: \(result)")
        switch result {
        case .failed(let error):
            print(error)
        case .cancelled:
            print("User cancelled login.")
        case .success(_, _, _): //No need to use any values
            self.performSegue(withIdentifier: "displayDetail", sender: nil)
        }
        print("Logged in!")
    }
}
