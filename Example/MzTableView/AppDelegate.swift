//
//  AppDelegate.swift
//  MzTableView
//
//  Created by Mohammad Zakizadeh on 4/23/20.
//  Copyright © 2020 Mz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        
        window?.rootViewController = rootVC
        
        window?.becomeFirstResponder()
        
        return true
    }

}

