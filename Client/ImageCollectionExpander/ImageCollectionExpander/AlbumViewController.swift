//
//  AlbumViewController.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 12/4/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit

class AlbumViewController: BaseViewController {

    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    fileprivate let cellReuseIdentifier = "ImageCollectionViewCell"
    fileprivate let cellReuseIdentifierAddImage = "AddImageCollectionViewCell"
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    
    var album:ImageCollection?
    var isDemo:Bool = true
    
    var selectedImageIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        photosCollectionView.register(UINib.init(nibName: "AddImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AddImageCollectionViewCell")
        
        title = "Photos"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AlbumViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (album?.images.count ?? (isDemo ? 10 : 0)) + 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isDemo {
            if indexPath.row == 10 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifierAddImage,
                                                          for: indexPath) as! AddImageCollectionViewCell
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier,
                                                              for: indexPath) as! ImageCollectionViewCell
                
               cell.photoImageView.image = #imageLiteral(resourceName: "backgroundImage")
               return cell
            }
        }
        
        if let images = album?.images {
            if indexPath.row < images.count {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier,
                                                              for: indexPath) as! ImageCollectionViewCell
                
                cell.photoImageView.setImageWith(URL(string:(album?.images[0].uri ?? ""))!)
                return cell
            }
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifierAddImage,
                                                      for: indexPath) as! AddImageCollectionViewCell
        return cell


        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImageIndex = indexPath.row
        self.performSegue(withIdentifier: "showImageDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImageDetails" {
            let vc = segue.destination as! PhotoViewController
            vc.images = album?.images ?? [Image]()
            vc.currentIndex = selectedImageIndex
            
            if isDemo {
                var tags:[Tag] = []
                for i in 1..<5 {
                    let tag = Tag(id: 1, isFromGetty: false)
                    tag.phrase = "tag \(i)"
                    tags.append(tag)
                }
                
                var images:[Image] = []
                for i in 1..<5 {
                    let image = Image(id: 1, description: "\(i) Falling back to loading access token from NSUserDefaults because of simulator bug", flickrLoc: nil, imageFlickrSize: nil, fromApi: nil, gettyLoc: nil, imageGettySize: nil, imageColor: nil, imageTags: tags, imageTitle: "Image title \(i)", imageUri: nil)
                    images.append(image)
                }
                
                
                vc.images = images
                vc.currentIndex = 0
            }
        }
    }
}
