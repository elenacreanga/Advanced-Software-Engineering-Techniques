//
//  AlbumCollectionViewCell.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 12/4/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit
import AFNetworking

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        tagsLabel.text = ""
        coverImageView.image = nil
    }
    
    func setAlbum(album:ImageCollection){
//        titleLabel.text = "Album".uppercased()
//        coverImageView.image = #imageLiteral(resourceName: "backgroundImage")
//        tagsLabel.text = "soare, vara, mare, plaja, albastru"
//        return
        
        titleLabel.text = album.name.uppercased()
        coverImageView.setImageWith(URL(string:(album.images[0].uri ?? ""))!)
        
        var tags:String = ""
        for tag:Tag in album.tags {
            if let phrase = tag.phrase {
                tags.append(tags == "" ? "" : ", ")
                tags.append(phrase)
            }
        }
        tagsLabel.text = tags
    }
}
