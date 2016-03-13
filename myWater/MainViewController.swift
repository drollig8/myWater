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
    
    @IBOutlet weak var addEntryButton: UIButton!
    @IBAction func addEntry(sender: UIButton) {
        let frame = CGRectMake(0, super.view.frame.height,super.view.frame.width, super.view.frame.height)
        

        
        dismissButton = UIButton(frame: view.frame)
        dismissButton.addTarget(self, action: "dissmissSelectionView", forControlEvents: .TouchUpInside)
        view.addSubview(dismissButton)
        
        // Animation ohne Test
        selectionView = SelectionView(frame: frame)

        view.addSubview(selectionView)
        UIView.animateWithDuration(1.0) { () -> Void in
            self.selectionView.frame.origin.y = super.view.frame.height / 2 }
    
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
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            // animation
            self.selectionView?.frame.origin.y = super.view.frame.height
            }) { (result) -> Void in
                self.selectionView?.removeFromSuperview()
        }
       // selectionView?.removeFromSuperview()
        dismissButton?.removeFromSuperview()
    }
    
}
