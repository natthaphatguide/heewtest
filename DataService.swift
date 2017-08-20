//
//  dataService.swift
//  heew
//
//  Created by Pathompong Puangpong on 8/8/2560 BE.
//  Copyright © 2560 heew. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage


let DB_BASE = Database.database().reference()
let STORAGE_BASE = Storage.storage().reference()

class DataService {
    
    static let ds = DataService()
    
    //Database Reference
    private var _REF_DB_BASE = DB_BASE
    private var _REF_DB_USERS = DB_BASE.child("Users")
    private var _REF_DB_USERS_POST = DB_BASE.child("UserPost").child("User")
    private var _REF_DB_TRANSACTION_BUY = DB_BASE.child("Transaction").child("User").child("Buying")
    private var _REF_DB_TRANSACTION_SELL = DB_BASE.child("Transaction").child("User").child("Selling")
    private var _REF_DB_PUBLICPOST = DB_BASE.child("PublicPost")
    
    //Storage Reference
    private var _REF_STORAGE_USERS_IMAGES = STORAGE_BASE.child("User_Images").child("User")
    private var _REF_STORAGE_ADMIN_IMAGES = STORAGE_BASE.child("Admin_Images")
    //private var _REF_POST_IMAGES = STORAGE_BASE.child("-pics").child("users")
    
    var REF_DB_BASE: DatabaseReference {
        return _REF_DB_BASE
    }
    
    var REF_DB_USERS: DatabaseReference {
        return _REF_DB_USERS
    }
    var REF_DB_USERS_POST: DatabaseReference {
        return _REF_DB_USERS_POST
    }
    
    var REF_DB_TRANSACTION_BUY: DatabaseReference {
        return _REF_DB_TRANSACTION_BUY
    }
    var REF_DB_TRANSACTION_SELL: DatabaseReference {
        return _REF_DB_TRANSACTION_SELL
    }
    
    var REF_DB_PUBLICPOST: DatabaseReference{
        return _REF_DB_PUBLICPOST
    }
    
    /*
    var REF_USER_CURRENT: DatabaseReference {
        //let uid = KeychainWrapper.defaultKeychainWrapper.string(forKey: KEY_UID)
        //let user = REF_USERS.child(uid!)
        return _REF_USER_CURRENT
    }
    */
    var REF_STORAGE_ADMIN_IMAGES: StorageReference {
        return _REF_STORAGE_ADMIN_IMAGES
    }
    var REF_STORAGE_USERS_IMAGES: StorageReference {
        return _REF_STORAGE_USERS_IMAGES
    }
    
    //SECTION 153: Create user data in firebase
    func createFirebaseDBUSER(uid: String, userData: Dictionary<String, String>) {
        REF_DB_USERS.child(uid).updateChildValues(userData)
    }
    
    func createRequest(uid: String, postRequest: Dictionary<String, Any>) {
        //REF_REQUEST.child(uid).childByAutoId(postRequest)
    }
    
}
