//
//  HomeViewController.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 12/4/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit
import AFNetworking
import FBSDKLoginKit


class HomeViewController: BaseViewController {
    
    @IBOutlet weak var albumsCollectionView: UICollectionView!
    var collectionNameTextField:UITextField?

    fileprivate let cellReuseIdentifier = "AlbumCollectionViewCell"
    fileprivate let itemsPerRow: CGFloat = 1
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    
    var albums:[ImageCollection]?
    var selectedAlbum:ImageCollection?
    let isDemo:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "iExpand"
        navigationItem.setHidesBackButton(true, animated: false)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewAlbum))
        navigationItem.setRightBarButton(addButton, animated: false)
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.setLeftBarButton(logoutButton, animated: false)
        
        albumsCollectionView.delegate = self
        albumsCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    dynamic func addNewAlbum(){
        let albumName = UIAlertController(title: "Add new collection:", message:nil, preferredStyle:.alert)
        albumName.addTextField(configurationHandler: addTextField)
        albumName.addAction(UIAlertAction(title: "Cancel", style:.cancel, handler: nil))
        albumName.addAction(UIAlertAction(title: "OK", style:.default, handler: albumAdded))
        present(albumName, animated: true, completion: nil)
    }
    
    dynamic func swizzledFunction() {
        let albumName = UIAlertController(title: "Edit collection:", message:nil, preferredStyle:.alert)
        albumName.addTextField(configurationHandler: addTextField)
        albumName.addAction(UIAlertAction(title: "Cancel", style:.cancel, handler: nil))
        albumName.addAction(UIAlertAction(title: "OK", style:.default, handler: albumAdded))
        present(albumName, animated: true, completion: nil)
    }
    
    func albumAdded(alert: UIAlertAction!){
            print(collectionNameTextField!.text)
    }
    
    func addTextField(textField: UITextField!){
        textField.placeholder = "Collection name"
        collectionNameTextField = textField
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum" {
            let destinationVC = segue.destination as! AlbumViewController
            destinationVC.isDemo = isDemo
            if !isDemo {
                destinationVC.album = selectedAlbum
            }
        }
    }
    
    func logout() {
        FBSDKLoginManager().logOut()
        if let _ = AppStateManager.sharedInstance.fsm.transitionWith(transition:.Logout) {
            self.navigationController?.popViewController(animated: true)
        } else {
            print("Transition was not valid")
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums?.count ?? (isDemo ? 4 : 0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier,
                                                      for: indexPath) as! AlbumCollectionViewCell
       
        if isDemo {
            cell.setDemoAlbum()
        } else {
            if let album:ImageCollection = albums?[indexPath.row] {
                cell.setAlbum(album: album)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem * 0.5)
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
        if !isDemo {
            selectedAlbum = albums?[indexPath.row]
        }
    }
}
