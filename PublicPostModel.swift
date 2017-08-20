//
//  DB_publicPost_Model.swift
//  heew
//
//  Created by Pathompong Puangpong on 8/8/2560 BE.
//  Copyright © 2560 heew. All rights reserved.
//
//

/* Structure Model
 
    PublicPost {
**==>     PostKeyID: {
            post data info
    }
 }
 
  UserPost{
        userID{
**==>       postKeyID: postID in PublicPost
        }
    }
    
 */

import Foundation

class PublicPostModel {
    
    private var _postKey: String! // KeyID ref
    private var _uid: String!     // userID Of owner post
    private var _imageUrl: String!
    private var _brand: String!
    private var _price: String!
    private var _carryFee: String!
    private var _evnet: String!

    var postKey: String {
        return _postKey
    }
    var uid: String {
        return _uid
    }
    var imageUrl: String {
        return _imageUrl
    }
    
    var brand: String {
        return _brand
    }
    
    var price: String {
        return _price
    }
    
    var carrtFee: String {
        return _carryFee
    }
    
    var evnet: String {
        return _evnet
    }
    
    init(uid: String, imageUrl: String, brand: String, price: String, carryFee:String, evnet: String) {
        self._uid = uid
        self._imageUrl = imageUrl
        self._brand = brand
        self._price = price
        self._carryFee = carryFee
        self._evnet = evnet
    }
    
    init(postKey: String, postData: Dictionary<String,Any>) {
        self._postKey = postKey
        
        if let uid = postData["uid"] as? String {
            self._uid = uid
        }
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let brand = postData["brand"] as? String {
            self._brand = brand
        }
        
        if let price = postData["price"] as? String {
            self._price = price
        }
        if let carryFee = postData["carryFee"] as? String {
            self._carryFee = carryFee
        }
        if let evnet = postData["evnet"] as? String {
            self._evnet = evnet
        }
        
    }
}
