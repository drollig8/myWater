//
//  Controller.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var selectionView:SelectionView!
    var dismissButton: UIButton!
    let heightRatioCollectionViewToSuperView: CGFloat = 2/3
    
    @IBOutlet weak var addEntryButton: UIButton!
    @IBAction func addEntry(sender: UIButton) {
        let selectionFrame = CGRectMake(0, super.view.frame.height,super.view.frame.width, super.view.frame.height*heightRatioCollectionViewToSuperView)
        

        
        dismissButton = UIButton(frame: view.frame)
        dismissButton.addTarget(self, action: "dissmissSelectionView", forControlEvents: .TouchUpInside)
        view.addSubview(dismissButton)
        
        // Animation ohne Test
        selectionView = SelectionView(frame: selectionFrame)

        view.addSubview(selectionView)
        UIView.animateWithDuration(0.7) { () -> Void in
            self.selectionView.frame.origin.y = self.view.frame.height - selectionFrame.height }
    
    }
    
    override func viewDidLoad() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dissmissSelectionView", name: "DismissSelectionView", object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    func dissmissSelectionView() {
        // Animation ohne Test
        UIView.animateWithDuration(0.7, animations: { () -> Void in
            // animation
            self.selectionView?.frame.origin.y = super.view.frame.height
            }) { (result) -> Void in
                self.selectionView?.removeFromSuperview()
        }
       // selectionView?.removeFromSuperview()
        dismissButton?.removeFromSuperview()
    }
    
}
