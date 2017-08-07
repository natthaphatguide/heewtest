//
//  PostVC.swift
//  heew
//
//  Created by Natthaphat on 8/7/17.
//  Copyright © 2017 heew. All rights reserved.
//

import UIKit

class PostVC: UIViewController {

    @IBOutlet weak var brandField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var carryFeeField: UITextField!
    @IBOutlet weak var eventNameField: UITextField!
    
    //ปุ่มจะไปเลือก category ใน array
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func postBtnPress(_ sender: Any) {
    }
    
}
