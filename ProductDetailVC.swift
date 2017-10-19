//
//  ProductDetailVC.swift
//  heew
//
//  Created by Pathompong Puangpong on 10/19/2560 BE.
//  Copyright © 2560 heew. All rights reserved.
//

import UIKit
import Firebase
class ProductDetailVC: UIViewController {

    @IBOutlet var imageView: UIImageView!{
        didSet{
            //Load image from url
        }
    }
    @IBOutlet var brand: UILabel!{
        didSet{
            brand.text = PublicPost?.brand
        }
    }
    @IBOutlet var price: UILabel!{
        didSet{
            price.text = PublicPost?.price
        }
    }
    @IBOutlet weak var event: UILabel!{
        didSet{
            event.text = PublicPost?.evnet
        }
    }

    
    var PublicPost: PublicPostModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

 
    @IBAction func buyBtnPress(_ sender: Any) {
        // Initial transection record
        print("Buy Button Press")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
