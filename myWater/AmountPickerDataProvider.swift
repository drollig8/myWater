//
//  AmountPickerDataSource.swift
//  myWater
//
//  Created by Marc Felden on 14.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class AmountPickerDataProvider: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    let values = ["30ml (espresso)","50ml (schnapsglas)","100ml","150ml","200ml (tasse)","250ml (glas)","300ml","330ml","400ml","500ml","1000ml (Liter)"]
    let amounts = [30,50,100,150,200,250,300,330,400,500,1000]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NSNotificationCenter.defaultCenter().postNotificationName("AmountSelectionChanged", object: nil, userInfo: ["row":row])
    }
    
    func amountAtIndex(index:Int) -> Int {
        return amounts[index]
    }
}