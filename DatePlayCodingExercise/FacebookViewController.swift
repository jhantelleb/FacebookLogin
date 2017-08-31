//
//  ViewController.swift
//  DatePlayCodingExercise
//
//  Created by Jhantelle Belleza on 8/30/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class FacebookViewController: UIViewController, LoginButtonDelegate {
    
    var userProfile = ProfileModel()
    var accessToken: AccessToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = LoginButton(readPermissions: Constants.readPermissions)
        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
    }
    
    
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
        case .success(_, _, let accessToken):
            self.accessToken = accessToken
            fetchProfile()
            self.performSegue(withIdentifier: "displayDetail", sender: nil)
            print("Logged in!")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let _ = segue.destination as! ProfileDetailTableViewController
        
    }
    
    private func fetchProfile() {
        var profileImage = ""
        GraphRequest(graphPath: "/me", parameters: Constants.graphParameter).start { (response, result) in
            switch result {
            case .success(let response):
                //Get Email
                guard let email = response.dictionaryValue?["email"] as? String else { return }
                //Get First Name
                guard let firstName = response.dictionaryValue?["first_name"] as? String else { return }
                //Get Last Name
                guard let lastName = response.dictionaryValue?["last_name"] as? String else { return }
                //Get Picture URL
                if let picture = response.dictionaryValue?["picture"] as? [String: Any] {
                    if let data = picture["data"] as? [String:Any]  {
                        guard let url = data["url"] as? String else { return }
                            profileImage = url
                    }
                }
                
                //Store in Profile Model
                self.userProfile = ProfileModel(email: email, firstName: firstName, lastName: lastName, profileImage: profileImage)
                print(self.userProfile)
                
            //userProfile = ProfileModel(email: response.dictionaryValue?["email"], firstName: response.dictionaryValue?["email"], lastName: response.dictionaryValue?["email"])
            case .failed(let error):
                print(error)
            }
            
            
            //    userProfile = ProfileModel(email: <#T##String#>, firstName: <#T##String#>, lastName: <#T##String#>)
            //   print("Response: \(result)")
        }
    }
}

