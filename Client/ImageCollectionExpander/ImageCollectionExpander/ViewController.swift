//
//  ViewController.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 11/13/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: BaseViewController, FBSDKLoginButtonDelegate {

    let loginButton:FBSDKLoginButton = FBSDKLoginButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.loginBehavior = FBSDKLoginBehavior.native
        
        if (FBSDKAccessToken.current() != nil) {
            userAlreadyLogged()
        }
        
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    func userAlreadyLogged() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        } 
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
       
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
        } else if result.isCancelled {
            print("CANCELED")
        } else {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }
}

