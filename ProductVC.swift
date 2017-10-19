//
//  ProductVC.swift
//  heew
//
//  Created by Natthaphat on 8/7/17.
//  Copyright © 2017 heew. All rights reserved.
//

import UIKit
import Firebase
import Social
private let reuseIdentifier = "Cell"
class ProductVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    var postSet = [PublicPostModel]()
    static var imageCache: NSCache<NSString, UIImage> = NSCache()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("postSet loop")
        collectionView.delegate = self
        collectionView.dataSource = self

        
        //SECTION 154-155: Getting data from firebase
        DataService.ds.REF_DB_PUBLICPOST.observe(.value, with: { (snapshot) in
            self.postSet = []
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    if let postDict = snap.value as? Dictionary <String, Any> {
                        let key = snap.key
                        let post = PublicPostModel(postKey: key, postData: postDict)
                        self.postSet.append(post)
                    }
                }
            }
            self.collectionView.reloadData()
        })
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // Return the number of sections
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let post = postSet[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ProductCell {
        
                if let img = ProductVC.imageCache.object(forKey: post.imageUrl as NSString) {
                    cell.configureCell(post: post, img: img)
                    return cell
                } else {
                    cell.configureCell(post: post)
                    return cell
                }
            } else {
                return ProductCell()
            }
    }
    /*
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "ProductDetailSegue" {
            if shareEnabled {
                return false
            }
        }
        
        return true
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProductDetailSegue" {
            if let indexPath = collectionView.indexPathsForSelectedItems{
                let ProductDetailVC = segue.destination as! ProductDetailVC
                ProductDetailVC.PublicPost = postSet[indexPath[0].row]
                print("ProductDetailVC.PublicPost?.brand")
                print(ProductDetailVC.PublicPost?.brand)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}// Tag Class
