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
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    override func viewWillAppear(_ animated: Bool) {
        //hide the navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        //customize the background
        setBackgroundImage(backgroundImageName: "mountain")
        addBlurEffect()
    }
    
    func setBackgroundImage(backgroundImageName: String){
        //setting background image
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        imageViewBackground.image = UIImage(named: backgroundImageName)
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        view.insertSubview(imageViewBackground, at: 0)
        
        //unavsa logo
        //TODO: Scale logo
        let imageViewLogo = UIImageView(image: UIImage(named: "logo"))
        imageViewLogo.contentMode = UIViewContentMode.scaleAspectFit
        view.insertSubview(imageViewLogo, at: 2)
        imageViewLogo.translatesAutoresizingMaskIntoConstraints = false
        imageViewLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func addBlurEffect(){
        //setting the blur effect
        let blurView = UIVisualEffectView()
        blurView.frame = self.view.frame
        blurView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        blurView.effect = UIBlurEffect(style: .regular)
        view.insertSubview(blurView, at: 1)
    }
}
