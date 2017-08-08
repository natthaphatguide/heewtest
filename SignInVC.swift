//
//  SignInVC.swift
//  heew
//
//  Created by Natthaphat on 8/7/17.
//  Copyright © 2017 heew. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth

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
                    self.performSegue(withIdentifier: "goToTabberVC", sender: nil)
                    print ("HEEWADMIN: Successfully login with email")
                } else {
                    // Create new user if Auth failed.
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("GUIDE: Unable to authenticate with Firebase using email")
                        } else {
                            
                            if let user = user {
                                let userData = ["provider": user.providerID, "User": email]
                                self.completeSignIn(id: user.uid, userData: userData)
                                print ("HEEWADMIN: Error to login ==> Create new user")
                            }
                        }
                    })
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
    
    // Development only for create user info in database
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUSER(uid: id, userData: userData)
        performSegue(withIdentifier: "goToTabberVC", sender: nil)
    }

    
    
    

}
