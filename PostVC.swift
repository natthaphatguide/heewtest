//
//  PostVC.swift
//  heew
//
//  Created by Natthaphat on 8/7/17.
//  Copyright © 2017 heew. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class PostVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var brandField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var carryFeeField: UITextField!
    @IBOutlet weak var eventNameField: UITextField!
    @IBOutlet weak var imageAdd: UIImageView!
    
    
    var imageSelected = false
    var imagePicker: UIImagePickerController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self

    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            imageAdd.image = image
            imageSelected = true
        } else {
            print ("GUIDE: A valide image wasn't selected")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func addImagePressed(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func postBtnPress(_ sender: Any) {
        
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
            
            DataService.ds.REF_STORAGE_USERS_IMAGES.child(userID).child(imgUid).putData(imgData, metadata: metadata, completion: { (metadata, error) in
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
    
    }
    
    
    
//=======================================================
// Section Fucntion
//=======================================================

    //Section160: Make post works
    func postToFirebase(uid:String ,imgUrl:String) {
        let post: Dictionary<String, Any> = [
            "uid": uid,
            "imageUrl": imgUrl,
            "brand": brandField.text!,
            "price": priceField.text!,
            "carryFee": carryFeeField.text!,
            "evnet": eventNameField.text!
        ]

        let userPost: Dictionary<String, Any> = [
            "brand": brandField.text!,
            "price": priceField.text!,
            "carryFee": carryFeeField.text!,
            "evnet": eventNameField.text!
        ]
        
        let publicPostKey = DataService.ds.REF_DB_PUBLICPOST.childByAutoId().key
        let publicPost = DataService.ds.REF_DB_PUBLICPOST.child(publicPostKey)
        let userPostID = DataService.ds.REF_DB_USERS_POST.child(uid).child(publicPostKey)
        publicPost.setValue(post)
        userPostID.setValue(userPost)

        
        // Clear input
        imageSelected = false
        imageAdd.image = UIImage(named: "placeholder")
        brandField.text = ""
        priceField.text = ""
        eventNameField.text = ""
        carryFeeField.text = ""
        //tableView.reloadData()
        
    }
    
    /*
     if let brand = postData["brand"] as? String {
     self._brand = brand
     }
     
     if let price = postData["price"] as? String {
     self._price = price
     }
     if let evnet = postData["evnet"] as? String {
     self._evnet = evnet
     }
 
 */
    
    
    
    
    
}
