//
//  UserPostModel.swift
//  heew
//
//  Created by Pathompong Puangpong on 8/8/2560 BE.
//  Copyright © 2560 heew. All rights reserved.
//

import Foundation

class UserPostModel {
    
    private var _postKey: String! // KeyID ref
    private var _brand: String!
    private var _price: String!
    private var _carryFee: String!
    private var _evnet: String!
    
    var postKey: String {
        return _postKey
    }

    var brand: String {
        return _brand
    }
    
    var price: String {
        return _price
    }
    var carryFee: String {
        return _carryFee
    }
    var evnet: String {
        return _evnet
    }
    
    init(brand: String, price: String, carryFee: String, evnet: String) {

        self._brand = brand
        self._price = price
        self._carryFee = carryFee
        self._evnet = evnet
    }
    
    init(postKey: String, postData: Dictionary<String,Any>) {
        self._postKey = postKey
        
        if let brand = postData["brand"] as? String {
            self._brand = brand
        }
        
        if let price = postData["price"] as? String {
            self._price = price
        }
        if let carryFee = postData["carryFee"] as? String {
            self._carryFee = carryFee
        }
        if let evnet = postData["event"] as? String {
            self._evnet = evnet
        }
        
    }
    
 
}
