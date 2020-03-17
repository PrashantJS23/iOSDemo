//
//  AppDelegate.swift
//  TestApplication
//
//  Created by WYH_MAC001 on 17/03/20.
//  Copyright © 2020 prashant. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.checkLogin()
        return true
    }

    func checkLogin(){
        if PreferenceManager.shared.tokenExist() {
            self.showHome()
        } else {
            self.showLogin()
        }
    }
    func getStoryBoard()-> UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
    
    func showHome()  {
        let navController = getStoryBoard().instantiateViewController(withIdentifier: "Home") as? UINavigationController
        self.window?.rootViewController = navController
    }
    
    func showLogin() {
        let controller = getStoryBoard().instantiateViewController(withIdentifier: "Login") as UIViewController
        self.window?.rootViewController = controller
    }
}

