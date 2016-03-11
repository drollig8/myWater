//
//  Beverage.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import Foundation

struct Beverage {
    let name: String
    let imageName: String?
    let waterFactor: Double?
    
    init(name: String, imageName:String? = nil, waterFactor: Double? = nil) {
        self.name = name
        self.imageName = imageName
        self.waterFactor = waterFactor
    }
}