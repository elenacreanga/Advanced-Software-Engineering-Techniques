//
//  PhotoViewController.swift
//  ImageCollectionExpander
//
//  Created by Bianca Tiba on 12/23/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageTags: UILabel!
    @IBOutlet weak var imageDescription: UILabel!
    @IBOutlet weak var imageDetailsView: UIView!
    
    var images:[Image]?
    var currentIndex:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setImageDetails()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showDetails(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showDetails(_ sender: UITapGestureRecognizer) {
        let alpha = self.imageDetailsView.isHidden ? 1 : 0
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.beginFromCurrentState, animations: {
            self.imageDetailsView.alpha = CGFloat(alpha)
        }, completion: { finished in
            self.imageDetailsView.isHidden = !self.imageDetailsView.isHidden
        })
    }
    
    func setImageDetails() {
        guard images != nil && currentIndex != nil else {
            return
        }
        
        self.imageDetailsView.isHidden = true
        
        let image:Image = images![currentIndex!]
        imageView.image = #imageLiteral(resourceName: "backgroundImage")
        //imageView.setImageWith(URL(string:(image.uri ?? ""))!)
        self.title = image.title
        imageTitle.text = image.title
        if let tags = image.tags {
            imageTags.text = "Tags: " + tags.map({"\($0.phrase ?? "")"}).joined(separator: ",")
        }
        imageDescription.text = image.shortDescription
    }

    @IBAction func onPrevious(_ sender: UIButton) {
        guard images != nil && currentIndex != nil else {
            return
        }
        
        if currentIndex != 0 {
            currentIndex = currentIndex! - 1
            self.setImageDetails()
        }
    }
    
    @IBAction func onNext(_ sender: UIButton) {
        guard images != nil && currentIndex != nil else {
            return
        }
        
        if currentIndex! < images!.count - 1 {
            currentIndex = currentIndex! + 1
            self.setImageDetails()
        }
    }
}
