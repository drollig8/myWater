//
//  BeverageManagerTests.swift
//  myWater
//
//  Created by Marc Felden on 13.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//


import XCTest

@testable import myWater

class BeverageManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_itemAtIndexReturnsBeverage() {
        let sut = BeverageManager()
        let beverage0 = sut.itemAtIndex(0,page:0)
        XCTAssertEqual(beverage0.name, "Wasser")
        XCTAssertEqual(beverage0.imageName, "water")
        let beverage1 = sut.itemAtIndex(5,page:1)
        XCTAssertEqual(beverage1.name, "Ayran")
        XCTAssertEqual(beverage1.imageName, "ayran")
    }
    
}

