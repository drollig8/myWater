//
//  AmountView.swift
//  myWater
//
//  Created by Marc Felden on 14.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class AmountView:UIView {
    
    let standardBorder:CGFloat = 22.0
    let segmentedControlWidth:CGFloat = 200.0
    let segmentedControlHeight:CGFloat = 28.0
    
    var okButton: UIButton!
    var backButton: UIButton!
    var amountPicker:UIPickerView!
    var amountPickerDataProvider = AmountPickerDataProvider()
    var imageView:UIImageView!
    var segmentedControl:UISegmentedControl!
    var valueTextField:UITextField!
    var itemInfo:(item:Int, page:Int)? {
        didSet {
            let beverage = BeverageManager().itemAtIndex(itemInfo!.item, page: itemInfo!.page)
            if let name = beverage.imageName {
                setupImageView(imageNamed: name)
            }
            
        }
    } // kann darüber über jede Instanz des BeverageManagers das Beverage bekommen.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.myWaterLightBlue()
        setupOkButton()
        setupBackButton()
        setupAmountPicker()
        setupSegmentedControl()
        setupValueTextField()
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
        addSubview(okButton)
        okButton.addTarget(self, action: "ok", forControlEvents: .TouchUpInside)
       // okButton.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.2)
    }
    
    private func setupBackButton() {
        let buttonFrame = CGRectMake(0, 0, 70, 70)
        
        // Es funktioniert tatsächlich die Tintcolor

        backButton = UIButton(type: UIButtonType.ContactAdd)
        backButton.frame = buttonFrame
        let image = UIImage(named: "backBlack")
        let imageScaled = image
        backButton.setImage(imageScaled, forState: .Normal)
        backButton.tintColor = UIColor.myWaterTextColorDarkBlue().colorWithAlphaComponent(0.5) // 0.1 für ausgegraut, 0.5 für wählbahr
        
        backButton.imageEdgeInsets = UIEdgeInsetsMake(25,25,25,25)
        addSubview(backButton)
        backButton.addTarget(self, action: "back", forControlEvents: .TouchUpInside)

    }
    
    private func setupSegmentedControl() {
        
        segmentedControl = UISegmentedControl(items: ["Wählen","Mein"])
        segmentedControl.tintColor = UIColor.myWaterSegmentedControlDarkGrey()
        segmentedControl.backgroundColor = testColor
        segmentedControl.frame = segmentedControlFrame
        segmentedControl.addTarget(self, action: "segmentChanged", forControlEvents: .ValueChanged)
        addSubview(segmentedControl)
        
    }
    
    
    // passt ganz gut mit der Höhe des Pickers
    private func setupAmountPicker() {
        amountPicker = UIPickerView(frame: amountPickerFrame)
        amountPicker.backgroundColor = testColor
        amountPicker.dataSource = amountPickerDataProvider
        amountPicker.delegate = amountPickerDataProvider
        addSubview(amountPicker)
    }
    
    private func setupImageView(imageNamed imageName:String) {

        imageView = UIImageView(frame: imageFrame)
        imageView.backgroundColor = testColor
        imageView.image = UIImage(named: imageName)
        addSubview(imageView)
    }

    private func setupValueTextField() {
        valueTextField = UITextField(frame: valueTextFieldFrame)
        valueTextField.text = "300"
        valueTextField.textColor = UIColor.myWaterTextColorDarkBlue()
        valueTextField.font = UIFont(name: "Arial", size: 32)
        addSubview(valueTextField)
        
    }
    
    func ok() {
    }
    
    func back() {
        NSNotificationCenter.defaultCenter().postNotificationName("DismissAmountView", object: self)
    }
    
    func segmentChanged() {
        
    }
    
    var segmentedControlFrame:CGRect {
        let xPos = frame.width/2 - segmentedControlWidth/2
        return CGRect(x: xPos, y: standardBorder, width: segmentedControlWidth, height: segmentedControlHeight)
    }
    
    var amountPickerFrame:CGRect {
        return CGRect(x: 0,y: frame.height - 200, width: frame.width, height: 200)
    }
    
    var imageFrame:CGRect {
        let borderDistance:CGFloat = 50.0
        return CGRect(x: borderDistance, y: 100, width: 60, height: 60)
    }
    
    var valueTextFieldFrame:CGRect {
        return CGRect(x: 155, y: 90, width: 70, height: 25)
    }
}


