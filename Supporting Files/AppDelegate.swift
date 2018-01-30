//
//  AppDelegate.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // TODO:- customize tabbar buttons
        let mapVC = LocationViewController()
        mapVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
//        mapVC.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: nil, action: nil)
        let collectionsVC = SavesViewController()
        collectionsVC.tabBarItem = UITabBarItem(title: "Collections", image: #imageLiteral(resourceName: "list"), tag: 1)
        
        let navVC1 = UINavigationController(rootViewController: mapVC)
        let navVC2 = UINavigationController(rootViewController: collectionsVC)
        let nacVC = [navVC1, navVC2]
        nacVC.forEach { ($0).navigationBar.barTintColor = UIColor(red: 38/255, green: 194/255, blue: 129/255, alpha: 1.0); ($0).navigationBar.tintColor = UIColor(red: 38/255, green: 103/255, blue: 194/255, alpha: 1.0); ($0).navigationBar.backgroundColor = UIColor(red: 38/255, green: 194/255, blue: 129/255, alpha: 1.0) }

        
        let tabbarVC = UITabBarController()
        tabbarVC.viewControllers = [navVC1, navVC2]
        tabbarVC.tabBar.barTintColor = UIColor(red: 38/255, green: 194/255, blue: 129/255, alpha: 1.0)
        tabbarVC.tabBar.tintColor = UIColor(red: 38/255, green: 103/255, blue: 194/255, alpha: 1.0)

        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabbarVC
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

