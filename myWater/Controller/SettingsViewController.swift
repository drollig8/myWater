//
//  SettingsViewController.swift
//  myWater
//
//  Created by Marc Felden on 16.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
    
    
    var titleLabel: UILabel!
    
    override func viewDidLoad() {
        setupLabels()
    }
    
    private func setupLabels() {
        titleLabel = UILabel(frame:CGRect(x: 20, y: 5, width: view.frame.width - 20, height: 25))
        titleLabel.text = "Einstellungen"
        titleLabel.textColor = UIColor.whiteColor()
        view.addSubview(titleLabel)
    }
}
