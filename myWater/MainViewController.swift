//
//  Controller.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var addEntryButton: UIButton!
    @IBAction func addEntry(sender: UIButton) {
        var frame = super.view.frame
        frame.size.height = frame.height / 2
        frame.origin.y = frame.height 
        let selectionView = SelectionView(frame: frame)
        view.addSubview(selectionView)
    }
}
