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
    var unitLabel:UILabel!
    let beverageManager = BeverageManager()
    
    var itemInfo:(item:Int, page:Int)? {
        didSet {
            let beverage = beverageManager.itemAtIndex(itemInfo!.item, page: itemInfo!.page)
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
        setupUnitLabel()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didChangeAmountSelection:", name: "AmountSelectionChanged", object: nil)
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
        segmentedControl.selectedSegmentIndex = 0
        addSubview(segmentedControl)
        
    }
    
    
    // passt ganz gut mit der Höhe des Pickers
    private func setupAmountPicker() {
        amountPicker = UIPickerView(frame: amountPickerFrame)
        amountPicker.backgroundColor = testColor
        amountPicker.dataSource = amountPickerDataProvider
        amountPicker.delegate = amountPickerDataProvider
        amountPicker.selectRow(5, inComponent: 0, animated: false)
        addSubview(amountPicker)
    }
    
    private func setupImageView(imageNamed imageName:String) {

        imageView = UIImageView(frame: imageFrame)
        imageView.backgroundColor = testColor
        imageView.image = UIImage(named: imageName)
        imageView.backgroundColor = testColor
        addSubview(imageView)
    }
// TODO test that testfield receives selected value
    private func setupValueTextField() {
        valueTextField = UITextField(frame: valueTextFieldFrame)
        let selectedRow = amountPicker.selectedRowInComponent(0)
        let amount = amountPickerDataProvider.amountAtIndex(selectedRow)
        
        valueTextField.text = "\(amount)"
        valueTextField.textColor = UIColor.myWaterTextColorDarkBlue()
        valueTextField.font = UIFont.systemFontOfSize(32, weight: UIFontWeightLight)
        valueTextField.enabled = false
        valueTextField.keyboardType = UIKeyboardType.NumberPad
        valueTextField.textAlignment = .Right
        valueTextField.backgroundColor = testColor
        addSubview(valueTextField)
        
    }
    
    private func setupUnitLabel() {
        unitLabel = UILabel(frame: unitLabelFrame)
        unitLabel.text = "ml"
        unitLabel.textColor = UIColor.myWaterTextColorDarkBlue()
        unitLabel.font = UIFont(name: "Arial",size: 32)
        addSubview(unitLabel)
        
    }
    
    func didChangeAmountSelection(notification:NSNotification) {
        let row = notification.userInfo!["row"] as! Int
        print(row)
        valueTextField.text = amountPicker.delegate?.pickerView!(amountPicker, titleForRow: amountPicker.selectedRowInComponent(0), forComponent: 0)
        print(amountPicker.delegate?.pickerView!(amountPicker, titleForRow: amountPicker.selectedRowInComponent(0), forComponent: 0))
    }
    func ok() {
    }
    
    func back() {
        NSNotificationCenter.defaultCenter().postNotificationName("DismissAmountView", object: self)
    }
    
    func segmentChanged() {
        if segmentedControl.selectedSegmentIndex == 1 {
            valueTextField.enabled = true
            valueTextField.becomeFirstResponder()
            valueTextField.text = ""
        } else {
            valueTextField.enabled = false
        }
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
        return CGRect(x: 145, y: 90, width: 70, height: 30)
    }
    
    var unitLabelFrame:CGRect {
        return CGRect(x: 220, y: 90, width: 70, height: 30)
    }
}


