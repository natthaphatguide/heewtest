//
//  ProductCell.swift
//  heew
//
//  Created by Pathompong Puangpong on 9/26/2560 BE.
//  Copyright © 2560 heew. All rights reserved.
//

import UIKit
import Firebase
class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var post: PublicPostModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(post: PublicPostModel, img: UIImage? = nil) {
        self.post = post
        self.brand.text = post.brand
        self.price.text = "\(post.price)"
        
        //Section 158: Downloading files from Firebase Storage
        if img != nil {
            self.productImageView.image = img
        } else {
            let ref = Storage.storage().reference(forURL: post.imageUrl)
            ref.getData(maxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if error !=  nil {
                    print("GUIDE: Unable to download image from Firebase Storage")
                } else {
                    print("GUIDE: Image downloaded from Firebase Storage")
                    if let imgData = data {
                        if let img = UIImage(data: imgData) {
                            self.productImageView.image = img
                            ProductVC.imageCache.setObject(img, forKey: post.imageUrl as NSString)
                        }
                    }
                }
            })
        }
    }

}
