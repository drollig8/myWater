//
//  SelectionDataProvider.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class SelectionDataProvider: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return BeverageCell()
    }
}

class BeverageCell: UICollectionViewCell {
    var textLabel: UILabel!
    override init(frame: CGRect) {
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        super.init(frame: frame)
        textLabel.text = "MMMM"
        layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}