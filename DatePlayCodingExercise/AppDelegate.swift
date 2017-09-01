//
//  AppDelegate.swift
//  DatePlayCodingExercise
//
//  Created by Jhantelle Belleza on 8/30/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import FacebookCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //MARK: SDK Application Delegate
        SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        //MARK: SDK Application Delegate handler
        let handled = SDKApplicationDelegate.shared.application(app, open: url, options: options)
        return handled
    }
    
}

