//
//  SelectionView.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class SelectionView: UIView, UIPageViewControllerDataSource {
  
    var closeButton:UIButton!
    var infoButton:UIButton!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.myWaterLightBlue()
        initiatePageViewController()
        setupNavigationBar()
    }
    

    private func setupCloseButton() {
        let buttonFrame = CGRectMake(frame.width-70, 0, 70, 70)
        closeButton = UIButton(frame: buttonFrame)
        let image = UIImage(named: "close")
        let imageScaled = image
        closeButton.setImage(imageScaled, forState: .Normal)
        closeButton.imageEdgeInsets = UIEdgeInsetsMake(25,25,25,25)
        self.addSubview(closeButton)
        closeButton.addTarget(self, action: "dismiss", forControlEvents: .TouchUpInside)
       // closeButton.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.2)
    }
    
    private func setupInfoButton() {
        let buttonFrame = CGRectMake(0, 0, 70, 70)
        infoButton = UIButton(frame: buttonFrame)
        infoButton.setImage(UIImage(named: "info"), forState: .Normal)
        self.addSubview(infoButton)
        infoButton.addTarget(self, action: "showInfo", forControlEvents: .TouchUpInside)
        infoButton.tintColor = UIColor.redColor() // kein Effekt
        //infoButton.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.2)
    }
    
    private func setupTitleLabel() {
        let titleFrame = CGRectMake(50, 22, frame.width-100, 25)
        titleLabel = UILabel(frame: titleFrame)
       // titleLabel.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.2)
        titleLabel.textAlignment = .Center
        titleLabel.text = "Ein Getränk wählen"
        titleLabel.font = UIFont(name: "Helvetica",size: 18)
        titleLabel.textColor = UIColor.myWaterTextColorDarkBlue()
        self.addSubview(titleLabel)
    }
    
    private func setupNavigationBar() {
        setupCloseButton()
        setupInfoButton()
        setupTitleLabel()
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
        
        // I think this is untestable
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGrayColor()
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.myWaterTextColorDarkBlue()
        
        
        
        self.addSubview(pageViewController.view)
    }
    
    // show indicator // TODO: Test THis
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return stackPageVC.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
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
    
    func dismiss() {
        NSNotificationCenter.defaultCenter().postNotificationName("DismissSelectionView", object: self)
    }
    func showInfo() {
        NSNotificationCenter.defaultCenter().postNotificationName("InfoButtonSelected", object: self)
    }

}

