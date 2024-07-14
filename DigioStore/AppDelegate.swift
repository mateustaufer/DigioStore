//
//  AppDelegate.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 13/07/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainNavigationController = UINavigationController(rootViewController: DigioStoreViewController())
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = mainNavigationController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
        
    }
    
}
