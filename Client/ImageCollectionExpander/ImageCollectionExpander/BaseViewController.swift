//
//  BaseViewController.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 12/4/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundView()
        addBlurView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addBackgroundView(){
        
        let bkView = UIImageView(image: #imageLiteral(resourceName: "backgroundImage2"))
        bkView.frame = self.view.bounds
        bkView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.insertSubview(bkView, at: 0)
    }
    
    func addBlurView(){
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.insertSubview(blurEffectView, at: 1)
        }
    }
}
