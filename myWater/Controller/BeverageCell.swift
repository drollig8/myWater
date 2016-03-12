//
//  BeverageCell.swift
//  myWater
//
//  Created by Marc Felden on 12.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class BeverageCell: UICollectionViewCell {
    
    var textLabel: UILabel!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        textLabel = UILabel(frame: CGRect(x: 0, y: 22, width: 22, height: 10))
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
        super.init(frame: frame)
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        self.addSubview(textLabel)
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func configureCellWithItem(item: Beverage) {
        textLabel.text = item.name
        if let imageName = item.imageName {
            imageView.image = UIImage(named: imageName)
        }
    }
}