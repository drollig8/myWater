//
//  SelectionDataProvider.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class SelectionDataProvider: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    let itemManager = BeverageManager()
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! BeverageCell
        cell.configureCellWithItem(itemManager.itemAtIndex(indexForIndexPath(indexPath), page: 0))
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // TODO Wir müssen auch mitgeben, auf welcher PageViewSeite wir waren!! Nein, das weiß der ViewCOntrooler selbst. der Denn ViewController 
        // pushed den nächsten Screen !
        NSNotificationCenter.defaultCenter().postNotificationName("ItemSelectedNotification", object: self, userInfo: ["index":indexPath.row])
    }
    

    // das geht better
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



//TODO:

/*
1. dim main screen (put something on there first)
2. recognize second screen
3. implement next view (amountselection)
*/