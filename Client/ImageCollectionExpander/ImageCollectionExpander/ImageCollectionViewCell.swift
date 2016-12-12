//
//  ImageCollectionViewCell.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 12/4/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var photoImageView: UIImageView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
    }
}
