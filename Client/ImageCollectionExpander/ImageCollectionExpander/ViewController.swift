//
//  ViewController.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 11/13/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.loginBehavior = FBSDKLoginBehavior.native
        
        if (FBSDKAccessToken.current() != nil) {
            statusLabel.text = "User logged in."
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        statusLabel.text = "No user logged in."
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
        } else if result.isCancelled {
            print("CANCELED")
        } else {
            statusLabel.text = "User logged in."
        }
    }
}

