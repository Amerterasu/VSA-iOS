//
//  ViewController.swift
//  VSA
//
//  Created by Khoa Le on 8/8/18.
//  Copyright © 2018 Khoa Le. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseUI
class ViewController: UIViewController, FUIAuthDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any]) -> Bool{
        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        // other URL handling goes here.
        return false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let authUI = FUIAuth.defaultAuthUI()
        let authViewController =  authUI!.authViewController()
        let db = Firestore.firestore()
        authUI?.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(),
            FUIFacebookAuth(),
            FUITwitterAuth(),
            FUIPhoneAuth(authUI: FUIAuth.defaultAuthUI()!),
            ]
        authUI?.providers = providers
        
        showDetailViewController(authViewController, sender: nil)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        print(authDataResult?.user)
        print("HELLO")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

