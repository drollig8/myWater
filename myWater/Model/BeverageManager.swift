//
//  BeverageManager.swift
//  myWater
//
//  Created by Marc Felden on 13.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import Foundation

class BeverageManager {
 
    func itemAtIndex(index: Int, page: Int) -> Beverage {
        
        switch (index,page) {
        case (0,0): return Beverage(name: "Wasser", imageName: "water", waterFactor: 1.0)
        case (1,0): return Beverage(name: "Tee", imageName: "tea", waterFactor: 1.0)
        case (2,0): return Beverage(name: "Kaffee", imageName: "coffee", waterFactor: 1.0)
        case (3,0): return Beverage(name: "Milch", imageName: "milk", waterFactor: 1.0)
        case (4,0): return Beverage(name: "Sodawasser", imageName: "soda", waterFactor: 1.0)
        case (5,0): return Beverage(name: "Saft", imageName: "juice", waterFactor: 1.0)
        case (6,0): return Beverage(name: "Bier", imageName: "beer", waterFactor: 1.0)
        case (7,0): return Beverage(name: "Wein", imageName: "wine", waterFactor: 1.0)
        case (8,0): return Beverage(name: "Alkohol", imageName: "alcohol", waterFactor: 1.0)
        case (0,1): return Beverage(name: "Energydrink", imageName: "energy", waterFactor: 1.0)
        case (1,1): return Beverage(name: "Smusi", imageName: "smoothie", waterFactor: 1.0)
        case (2,1): return Beverage(name: "Kaltschale", imageName: "kaltschale", waterFactor: 1.0)
        case (3,1): return Beverage(name: "Kefir", imageName: "kefir", waterFactor: 1.0)
        case (4,1): return Beverage(name: "Joghurt", imageName: "joghurt", waterFactor: 1.0)
        case (5,1): return Beverage(name: "Ayran", imageName: "ayran", waterFactor: 1.0)
        case (6,1): return Beverage(name: "Kakoa", imageName: "kakao", waterFactor: 1.0)
        case (7,1): return Beverage(name: "Kwass", imageName: "kwass", waterFactor: 1.0)
        case (8,1): return Beverage(name: "Anderes", imageName: "other", waterFactor: 1.0)
        default: return Beverage(name: "Wasser", imageName: "water", waterFactor: 1.0)
        }
    }
}