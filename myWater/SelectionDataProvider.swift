//
//  SelectionDataProvider.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class SelectionDataProvider: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    init(page:Int) {
        self.page = page
    }
    
    let itemManager = BeverageManager()
    var page: Int = 0
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! BeverageCell
        cell.configureCellWithItem(itemManager.itemAtIndex(indexForIndexPath(indexPath), page: page))
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        NSNotificationCenter.defaultCenter().postNotificationName("ItemSelectedNotification", object: self, userInfo: ["index":indexForIndexPath(indexPath),"page":page])
    }
    
    private func indexForIndexPath(indexPath: NSIndexPath) -> Int {
        switch indexPath {
            case NSIndexPath(forItem: 0, inSection: 0): return 0
            case NSIndexPath(forItem: 1, inSection: 0): return 1
            case NSIndexPath(forItem: 2, inSection: 0): return 2
            case NSIndexPath(forItem: 0, inSection: 1): return 3
            case NSIndexPath(forItem: 1, inSection: 1): return 4
            case NSIndexPath(forItem: 2, inSection: 1): return 5
            case NSIndexPath(forItem: 0, inSection: 2): return 6
            case NSIndexPath(forItem: 1, inSection: 2): return 7
            case NSIndexPath(forItem: 2, inSection: 2): return 8
            default: return 0
        }
    }
}