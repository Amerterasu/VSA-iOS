//
//  AppDelegate.swift
//  VSA
//
//  Created by Khoa Le on 8/8/18.
//  Copyright © 2018 Khoa Le. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, FUIAuthDelegate{

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        let authUI = FUIAuth.defaultAuthUI()
        
        authUI?.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(),
            FUIFacebookAuth(),
            FUITwitterAuth(),
            FUIPhoneAuth(authUI: FUIAuth.defaultAuthUI()!),
            ]
        authUI?.providers = providers
        let authViewController =  authUI!.authViewController()
        self.window?.rootViewController = authViewController
        self.window?.makeKeyAndVisible()
        return true
    }
    
    
    func authPickerViewController(for authUI: FUIAuth) -> FUIAuthPickerViewController {
        return FUICustomAuthPickerViewController(authUI: authUI)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        print("Successfully signed in")
        
        if let printError = error{
            print("ERROR")
            print(printError)
            return
        }
        guard let user = authDataResult?.user else{
            print("Failed to sign in user")
            return
        }
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homePage = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.window?.rootViewController = homePage
    }
    
    func authPickerViewController(forAuthUI authUI: FUIAuth) -> FUIAuthPickerViewController {
        return FUICustomAuthPickerViewController(authUI: authUI)
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

