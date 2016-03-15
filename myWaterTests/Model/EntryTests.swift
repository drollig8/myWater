//
//  WaterEntryTests.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest
@testable import myWater

class EntryTests: XCTestCase {

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
        let entry = Entry(date: testDate)
        XCTAssertEqual(testDate, entry.date)
        
    }
    
    
    func testInit_SetsDateAndBeverage() {
        let testDate = NSDate()
        let entry = Entry(date: testDate, beverage: Beverage(name: "Test"))
        XCTAssertEqual(entry.beverage?.name, "Test")
        
    }
    
    func testInit_SetsDateAndBeverageAndAmount() {
        let testDate = NSDate()
        let entry = Entry(date: testDate, beverage: nil, amount: 270)
        XCTAssertEqual(entry.amount, 270)
    }


}
