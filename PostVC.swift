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
        /*
        let userID = Auth.auth().currentUser!.uid
        
        guard let brand = brandField.text, brand != "" else {
            print("GUIDE: Brand must be entered")
            return
        }
        
        guard let price = priceField.text, price != "" else {
            print("GUIDE: Price must be entered")
            return
        }
        
        guard let img = imageAdd.image, imageSelected == true else {
            print("GUIDE: Image must be selected")
            return
        }
        
        if let imgData = UIImageJPEGRepresentation(img, 0.2) {
            let imgUid = NSUUID().uuidString
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            
            DataService.ds.REF_POST_IMAGES.child(imgUid).putData(imgData, metadata: metadata, completion: { (metadata, error) in
                if error != nil {
                    print("GUIDE: Unable to upload image to Firebase Storage")
                } else {
                    print("GUIDE: Successfully uploaded image to Firebase Storage")
                    let downloadURL = metadata?.downloadURL()?.absoluteString
                    if let url = downloadURL {
                        self.postToFirebase(uid:userID, imgUrl: url)
                    }
                }
            })
        }
        */
    }
    
    
    
//=======================================================
// Section Fucntion
//=======================================================
    /*
    //Section160: Make post works
    func postToFirebase(uid:String ,imgUrl:String) {
        let post: Dictionary<String, Any> = [
            "uid": uid,
            "imageUrl": imgUrl,
            "brand": brandField.text!,
            "price": priceField.text!          //How to post number??
        ]
        
        let firebasePost = DataService.ds.REF_POSTS.childByAutoId()
        firebasePost.setValue(post)
        
        imageSelected = false
        imageAdd.image = UIImage(named: "placeholder")
        brandField.text = ""
        priceField.text = ""
        
        //tableView.reloadData()
        
    }
    
    
    */
    
    
    
    
    
}
