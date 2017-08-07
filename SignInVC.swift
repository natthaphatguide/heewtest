//
//  SignInVC.swift
//  heew
//
//  Created by Natthaphat on 8/7/17.
//  Copyright © 2017 heew. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print ("HEEWADMIN: Successfully login with email")
                } else {
                    print ("HEEWADMIN: Error to login")
                }
            })
        }
    }

    @IBAction func facebookBtnPressed(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) {(result, error) in
            if error != nil {
                print("HEEWADMIN: Unable to authenticate with Facebook")
            } else if result?.isCancelled == true {
                print("HEEWADMIN: User cancelled authenticate with Facebook")
            } else {
                print("HEEWADMIN: Successfully authenticate with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: {(user, error) in
            if error != nil {
                print("HEEWADMIN: Unable to authenticate with Firebase/Facebook")
            } else {
                print("HEEWADMIN: Successfully authenticated with Firebase/Facebook")
                self.performSegue(withIdentifier: "goToTabberVC", sender: nil)
            }
        })
    }
    
}
