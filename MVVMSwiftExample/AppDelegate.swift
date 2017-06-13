//
//  AppDelegate.swift
//  MVVMSwiftExample
//
//  Created by Dino Bartosak on 25/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let gameLibrary: GameLibrary = InMemoryGameLibrary()
        
        let rootViewController: HomeViewController = window?.rootViewController as! HomeViewController
        rootViewController.gameLibrary = gameLibrary
        
        return true
    }
    
}

