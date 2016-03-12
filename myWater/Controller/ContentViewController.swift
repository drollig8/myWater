//
//  ContentViewController.swift
//  myWater
//
//  Created by Marc Felden on 12.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    var collectionDataProvider = SelectionDataProvider()
    
    
    // We need these because we will never instantiate the VC from the storyboard.
    /*
    func setupView() {
    }
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    override func loadView() {
        super.loadView()
        initiateCollectionView()
        self.view.addSubview(collectionView)
    }
    */
    

    override func viewDidLoad() {
  //      collectionView.dataSource = collectionDataProvider
        
        initiateCollectionView()
        self.view.addSubview(collectionView)

    }
    private func initiateCollectionView() {
        
        layout = UICollectionViewFlowLayout()
        let cellSize = super.view.frame.width / 3 - 10
        let sizeOfLabelUnderImage:CGFloat = 30
        layout.itemSize = CGSize(width: cellSize, height: cellSize + sizeOfLabelUnderImage)
   
        collectionView = UICollectionView(frame: super.view.frame, collectionViewLayout: layout)
      //  collectionView = UICollectionView(frame: CGRectMake(0, 0, 300, 250), collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.grayColor()
        collectionView.dataSource = collectionDataProvider
        collectionView.delegate = collectionDataProvider
        collectionView.registerClass(BeverageCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.yellowColor()
    }
}