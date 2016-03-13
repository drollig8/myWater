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
        
        super.init(frame: frame)
        let imageSize = CGSize(width: 60, height: 60)
        let textLabelSize = CGSize(width: 80, height: 20)
        
        imageView = UIImageView(frame: CGRect(x: 15, y: 10, width: imageSize.width, height: imageSize.height))
        textLabel = UILabel(frame: CGRect(x: 5, y: 70, width: textLabelSize.width, height: textLabelSize.height))
        
        textLabel.font = UIFont(name: "Helvetica", size: 13)
        textLabel.backgroundColor = UIColor.myWaterLightBlue()
        textLabel.textAlignment = .Center
        textLabel.textColor = UIColor.myWaterTextColorDarkBlue()
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
        print(item.name)
        textLabel.text = item.name
        if let imageName = item.imageName {
            imageView.image = UIImage(named: imageName)
            imageView.backgroundColor = UIColor.myWaterLightBlue()
        }
    }
    

}

