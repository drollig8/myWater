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
        
        
     //   textLabel.backgroundColor = UIColor.blackColor()
        
        let imageWidth:CGFloat = 100
        let frameWidth = frame.width
        let imageX = frameWidth / 2 - imageWidth / 2
        
        imageView = UIImageView(frame: CGRect(x: imageX, y: imageX, width: imageWidth, height: imageWidth))
       
        textLabel = UILabel(frame: CGRect(x: imageX, y: imageWidth, width: imageWidth, height: 20))
        textLabel.font = UIFont(name: "Arial", size: 12)
        textLabel.backgroundColor = UIColor.grayColor()
        textLabel.textAlignment = .Center
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
        //    imageView = UIImageView(x: 0, y: 0, image: UIImage(named: imageName)!, scaleToWidth: 128)
            imageView.image = UIImage(named: imageName)
            //imageView.contentMode = .ScaleAspectFit // Testen !!!
            imageView.backgroundColor = UIColor.myWaterLightBlue()
           
        }
    }
    
    func scale(frame frame: CGRect, withFactor factor:CGFloat) -> CGRect {
        return CGRectMake(frame.origin.x*factor, frame.origin.y*factor, frame.width*factor, frame.height * factor)
        
    }
}


private extension UIImageView {
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, imageName: String) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        image = UIImage(named: imageName)
    }
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, imageName: String, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        image = UIImage(named: imageName)
        scaleImageFrameToWidth(width: scaleToWidth)
    }
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, image: UIImage) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        self.image = image
    }
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, image: UIImage, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        self.image = image
        scaleImageFrameToWidth(width: scaleToWidth)
    }
    
    /// EZSwiftExtensions, scales this ImageView size to fit the given width
    func scaleImageFrameToWidth(width width: CGFloat) {
        let widthRatio = image!.size.width / width
        let newWidth = image!.size.width / widthRatio
        let newHeigth = image!.size.height / widthRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeigth)
    }
    
}