//
//  WaterEntryTests.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest
@testable import myWater

class WaterEntryTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit_SetsDate() {
        let testDate = NSDate()
        let waterEntry = WaterEntry(date: testDate)
        XCTAssertEqual(testDate, waterEntry.date)
        
    }
    
    /*
    func testInit_SetsDateAndBeverage() {
        let testDate = NSDate()
        let waterEntry = WaterEntry(date: testDate, beverage: Beverage(name: "Water"))
        XCTAssertEqual(testDate, waterEntry.date)
        
    }
*/

}
