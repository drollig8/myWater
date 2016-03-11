//
//  WaterEntry.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import Foundation

struct WaterEntry
{
    let date: NSDate
    let beverage: Beverage?
    let amount: Int?
    
    init(date: NSDate, beverage: Beverage? = nil, amount: Int? = nil) {
        self.date = date
        self.beverage = beverage
        self.amount = amount
    }

}
