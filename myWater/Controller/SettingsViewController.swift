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
    var customNavigationBar: UIView!
    var saveButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        setupCustomNavigationBar()

    }
    

    private func setupCustomNavigationBar() {
        
        customNavigationBar = UIView(frame: customNavigationbarFrame)
        customNavigationBar.backgroundColor = UIColor.myWaterNavBarBackgroundColor()
        view.addSubview(customNavigationBar)
        
        titleLabel = UILabel(frame:CGRect(x: 20, y: 30, width: view.frame.width - 40, height: 25))
        titleLabel.text = "Einstellungen"
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont.systemFontOfSize(18, weight: UIFontWeightMedium)
        
        titleLabel.textColor = UIColor.whiteColor()
        view.addSubview(titleLabel)
        
        saveButton = UIButton(frame: saveButtonFrame)
        saveButton.setTitle("Speichern", forState: .Normal)
        saveButton.addTarget(self, action: "save:", forControlEvents: .TouchUpInside)
        view.addSubview(saveButton)
    
    }
    
    var saveButtonFrame:CGRect {
        let width:CGFloat = 100
        let height:CGFloat = 65.0
        let xPos = view.frame.width - width
        return CGRect(x: xPos, y: 10, width: width, height: height)
    }
    
    var customNavigationbarFrame:CGRect {
        let width = view.frame.width
        let height:CGFloat = 65.0
        return CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    func save(sender:UIButton) {
        //
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
