//
//  TransactionBuying.swift
//  heew
//
//  Created by Pathompong Puangpong on 8/8/2560 BE.
//  Copyright © 2560 heew. All rights reserved.
//

import Foundation

class TransBuyModel{
    
    private var _transectionBuyID: String!  // KeyID ref for user
    private var _postKey: String!           // KeyID ref
    private var _ownerID: String!           // userID Of owner post
    private var _imageUrl: String!
    private var _amount: String!
    private var _totalPrice: String!
    private var _status: String!            // status of action state
    
    var postKey: String {
        return _postKey
    }
    var ownerID: String {
        return _ownerID
    }
    var imageUrl: String {
        return _imageUrl
    }
    
    var amount: String {
        return _amount
    }
    
    var totalPrice: String {
        return _totalPrice
    }
    
    var status: String {
        return _status
    }
    
    init(postKey: String, ownerID: String, imageUrl: String, amount: String, totalPrice: String, status: String) {
        self._postKey = postKey
        self._ownerID = ownerID
        self._imageUrl = imageUrl
        self._amount = amount
        self._totalPrice = totalPrice
        self._status = status
    }
    
    init(transectionBuyID: String, postData: Dictionary<String,Any>) {
        self._transectionBuyID = transectionBuyID
        
        
        if let postKey = postData["postKey"] as? String {
            self._postKey = postKey
        }
        if let ownerID = postData["ownerID"] as? String {
            self._ownerID = ownerID
        }
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let amount = postData["amount"] as? String {
            self._amount = amount
        }
        
        if let totalPrice = postData["totalPrice"] as? String {
            self._totalPrice = totalPrice
        }
        if let status = postData["status"] as? String {
            self._status = status
        }
        
    }

    
}
