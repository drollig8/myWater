//
//  AmountView.swift
//  myWater
//
//  Created by Marc Felden on 14.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class AmountView:UIView {
    
    var okButton: UIButton!
    var backButton: UIButton!
    var amountPicker:UIPickerView!
    var amountPickerDataProvider = AmountPickerDataProvider()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.myWaterLightBlue()
        setupOkButton()
        setupBackButton()
        setupAmountPicker()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupOkButton() {
        let buttonFrame = CGRectMake(frame.width-70, 0, 70, 70)
        okButton = UIButton(frame: buttonFrame)
        let image = UIImage(named: "ok")
        let imageScaled = image
        okButton.setImage(imageScaled, forState: .Normal)
        okButton.imageEdgeInsets = UIEdgeInsetsMake(25,25,25,25)
        self.addSubview(okButton)
        okButton.addTarget(self, action: "ok", forControlEvents: .TouchUpInside)
       // okButton.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.2)
    }
    
    private func setupBackButton() {
        let buttonFrame = CGRectMake(0, 0, 70, 70)
        
        // Es funktioniert tatsächlich die Tintcolor
        
      //  backButton = UIButton(frame: buttonFrame)
        backButton = UIButton(type: UIButtonType.ContactAdd)
        backButton.frame = buttonFrame
        let image = UIImage(named: "backBlack")
        let imageScaled = image
        backButton.setImage(imageScaled, forState: .Normal)
        backButton.tintColor = UIColor.myWaterTextColorDarkBlue().colorWithAlphaComponent(0.5) // 0.1 für ausgegraut, 0.5 für wählbahr
        
        backButton.imageEdgeInsets = UIEdgeInsetsMake(25,25,25,25)
        self.addSubview(backButton)
        backButton.addTarget(self, action: "back", forControlEvents: .TouchUpInside)

    }
    
    
    
    // passt ganz gut mit der Höhe des Pickers
    private func setupAmountPicker() {
        amountPicker = UIPickerView(frame: CGRect(x: 0,y: self.frame.height - 200, width: self.frame.width, height: 200))
        amountPicker.backgroundColor = testColor
        amountPicker.dataSource = amountPickerDataProvider
        amountPicker.delegate = amountPickerDataProvider
        self.addSubview(amountPicker)
    }
    

    
    func ok() {
    }
    
    func back() {
        NSNotificationCenter.defaultCenter().postNotificationName("DismissAmountView", object: self)
    }
}


