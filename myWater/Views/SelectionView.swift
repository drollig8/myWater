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
        self.backgroundColor = UIColor.redColor()
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
        currentStackVC = stackPageVC[stackStartLocation]
    }
    
    private func setupPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.setViewControllers([stackPageVC[stackStartLocation]], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        pageViewController.view.frame = CGRect(x: 0, y: 44, width: self.frame.width, height: self.frame.height - 44)
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

