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
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    
    var album:ImageCollection?
    var isDemo:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        
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
        return album?.images.count ?? (isDemo ? 10 : 0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier,
                                                      for: indexPath) as! ImageCollectionViewCell
        
        if isDemo {
            cell.photoImageView.image = #imageLiteral(resourceName: "backgroundImage")
        } else {
            cell.photoImageView.setImageWith(URL(string:(album?.images[0].uri ?? ""))!)
        }
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
}
