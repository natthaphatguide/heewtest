//
//  ProfileVC.swift
//  heew
//
//  Created by Natthaphat on 8/7/17.
//  Copyright © 2017 heew. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    //แสดงรูปจาก facebook มาแสดง
    //ถ้าหากคลิกจะสามารถ upload รูปได้
    
    @IBOutlet weak var nameLbl: UILabel!
    //แสดงชื่อ-นามสกุลของผู้ใช้งานโดยดึงจาก Firebase Database (users>name)
    
    @IBOutlet weak var emailLbl: UILabel!
    //แสดงชื่อ-นามสกุลของผู้ใช้งานโดยดึงจาก Firebase Database (users>email)
    
    override func viewDidLoad() {
    }

    @IBAction func logoutBtnPress(_ sender: Any) {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignInVC", sender: nil)
    }
   
}
