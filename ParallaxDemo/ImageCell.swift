//
//  ImageCell.swift
//  ParallaxDemo
//
//  Created by Yogie Putra on 10/23/16.
//  Copyright © 2016 Yogie Putra. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    
    @IBOutlet weak var parallaxImage: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    
    @IBOutlet weak var parallaxImageHeight: NSLayoutConstraint!
    @IBOutlet weak var parallaxTopConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        parallaxImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func configureCell(title: String, image: UIImage){
        self.imageTitle.text = title
        self.parallaxImage.image = image
    }

}
