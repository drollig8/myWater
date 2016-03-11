//
//  BeverageTests.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest

@testable import myWater
class BeverageTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit_SetsName() {
        let beverage = Beverage(name: "Test")
        XCTAssertEqual(beverage.name, "Test")
    }
    
    func testInit_SetsNameAndImage() {
        let beverage = Beverage(name: "Test", imageName: "water")
        XCTAssertEqual(beverage.imageName, "water")
    }

    func testInit_SetsNameAndImageAndWaterfactor() {
        let beverage = Beverage(name: "Test", imageName: "water", waterFactor: 0.7)
        XCTAssertEqual(beverage.waterFactor, 0.7)

    }
    
}
