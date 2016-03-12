//
//  SelectionView.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class SelectionView: UIView, UIPageViewControllerDataSource {
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        
        self.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.3)
        
        initiatePageViewController()
        
        
    }
    

    
    private func initiatePageViewController() {
 
        stackVC = self.viewControllerData()
        setupViewControllers()
        setupPageViewController()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    

    // PageController
    
    var pageViewController: UIPageViewController!
    var stackPageVC: [UIViewController]!
    var stackVC: [UIViewController]!
    var stackStartLocation = 0
    var currentStackVC: UIViewController!
    
    private func setupViewControllers() {
        stackPageVC = stackVC
        /*
        stackPageVC = [UIViewController]()
        for index in 0..<stackVC.count {
            let pageVC = UIViewController()
            pageVC.addChildViewController(stackVC[index])
            pageVC.view.addSubview(stackVC[index].view)
            stackVC[index].didMoveToParentViewController(pageVC)
            stackPageVC.append(pageVC)
        }
*/
        currentStackVC = stackPageVC[stackStartLocation]
    }
    
    private func setupPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.setViewControllers([stackPageVC[stackStartLocation]], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        pageViewController.view.frame = CGRect(x: 0, y: 44, width: 300, height: 550)
        self.addSubview(pageViewController.view)
    }

    
    // nur zu Testzwecken...
    

    
    private func viewControllerData() -> [ContentViewController] {
        let redVC = ContentViewController()
        redVC.view.backgroundColor = UIColor.redColor()
        let blueVC = ContentViewController()
        blueVC.view.backgroundColor = UIColor.blueColor()
        return [redVC, blueVC]
    }

    
    // PageController delegate & datasource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController == stackPageVC.first {
            return nil
        }
        return stackPageVC[stackPageVC.indexOf(viewController)! - 1]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController == stackPageVC.last {
            return nil
        }
        return stackPageVC[stackPageVC.indexOf(viewController)! + 1]
    }

}

class ContentViewController: UIViewController {
    var collectionView: UICollectionView!
    var collectionDataProvider = SelectionDataProvider()
    
    override func viewDidLoad() {
        initiateCollectionView()
        self.view.addSubview(collectionView)
    }
    private func initiateCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRectMake(0, 0, 100, 100), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.grayColor()
        collectionView.dataSource = collectionDataProvider
        collectionView.delegate = collectionDataProvider
    }
}
