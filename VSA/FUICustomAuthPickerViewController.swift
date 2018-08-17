//
//  FUICustomAuthPickerViewController.swift
//  VSA
//
//  Created by Khoa Le on 8/13/18.
//  Copyright © 2018 Khoa Le. All rights reserved.
//

import Foundation
import FirebaseUI

class FUICustomAuthPickerViewController: FUIAuthPickerViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.view.backgroundColor = UIColor.clear
//        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        //setting background image
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "mountain")
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        view.insertSubview(imageViewBackground, at: 0)
        
        //setting the blur effect
        let blurView = UIVisualEffectView()
        blurView.frame = self.view.frame
        blurView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        blurView.effect = UIBlurEffect(style: .regular)
        view.insertSubview(blurView, at: 1)
        
        //TODO: add swuvsa logo
        //TODO: add constraints
        
    }
}
