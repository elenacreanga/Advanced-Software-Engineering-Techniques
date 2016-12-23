//
//  AddImageCollectionViewCell.swift
//  ImageCollectionExpander
//
//  Created by Bianca Tiba on 12/23/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit

class AddImageCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
    }

}
