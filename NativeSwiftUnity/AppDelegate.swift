//
//  AppDelegate.swift
//  NativeSwiftUnity
//
//  Created by Kiarash on 10/31/19.
//  Copyright © 2019 Kiarash. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        UnityFrameworkWrapper.shared.framework.appController()?.applicationDidEnterBackground(application)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        UnityFrameworkWrapper.shared.framework.appController()?.applicationWillResignActive(application)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        UnityFrameworkWrapper.shared.framework.appController()?.applicationWillEnterForeground(application)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        UnityFrameworkWrapper.shared.framework.appController()?.applicationWillTerminate(application)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UnityFrameworkWrapper.shared.framework.appController()?.applicationDidBecomeActive(application)
    }


}

