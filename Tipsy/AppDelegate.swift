//
//  AppDelegate.swift
//  Tipsy
//
//  Created by Zhipeng Mei on 11/25/15.
//  Copyright © 2015 Zhipeng Mei. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //Creating Global Defaults
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        //new max and min values set to new defaults
        userDefaults.floatForKey("minimum_sliderVal")
        userDefaults.floatForKey("maximum_sliderVal")
        
        //set global default percentage, purpose is for random % and fixed % calculation
        userDefaults.doubleForKey("tip_Percentage")
        
        //split with how many people? set the new min and max with this default
        userDefaults.floatForKey("maximum_splitVal")
        
        
        
        let firstEverLoad = userDefaults.boolForKey("first_Ever_Load")

        //App first ever load launched with following values as system default
        if(!firstEverLoad){
            userDefaults.setFloat(5.00, forKey: "minimum_sliderVal")        //minimum default 5%
            userDefaults.setFloat(30.00, forKey: "maximum_sliderVal")       //maximum default 30%
            userDefaults.setDouble(15.00, forKey: "tip_Percentage")
            userDefaults.setFloat(15, forKey: "maximum_splitVal")           //max split default 15 people
            userDefaults.setBool(true, forKey: "first_Ever_Load")           //load this entire block of codes if first time running the app before user change the setting
            userDefaults.synchronize()
        }//once user edited the default settings, then the App will run the dynamic new setting the the above hardcoded defaults

        return true
    }

    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

