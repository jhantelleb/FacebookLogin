//
//  ProfileDetailTableViewController.swift
//  DatePlayCodingExercise
//
//  Created by Jhantelle Belleza on 8/31/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import FacebookCore

class ProfileDetailTableViewController: UITableViewController {
    
    var profiles: [ProfileModel] = []
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXib()
        self.fetchProfile()
        self.tableView.allowsSelection = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath) as! ProfileTableViewCell
        let profile = profiles[indexPath.row]
        cell.emailLabel?.text = String(format: "Email: %@", profile.email)
        cell.fullNameLabel?.text = String(format: "Full name: %@ %@", profile.firstName, profile.lastName)
        cell.profileImageview.addSubview(profile.profileImage)
        
        return cell
    }
    
    //MARK: Register Xib
    fileprivate func registerXib() {
        let nibName = UINib(nibName: Constants.xibName, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: Constants.reuseIdentifier)
    }
    
    //MARK: Fetch Profile using GraphRequest
    private func fetchProfile() {
        var imageURL = ""
        GraphRequest(graphPath: "/me", parameters: ["fields": "id, first_name, last_name, email, picture.type(large)"]).start { (response, result) in
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
                        imageURL = url
                    }
                }
                //For testing:
                let profile = ProfileModel(email: email, firstName: firstName, lastName: lastName, imageURL: imageURL)
                
                for _ in 1..<10 {
                    self.profiles.append(profile)
                }
                self.tableView.reloadData()
            case .failed(let error):
                print(error)
            }
        }
    }
}
