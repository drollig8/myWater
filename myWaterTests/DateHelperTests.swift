//
//  DateHelperTests.swift
//  myWater
//
//  Created by Marc Felden on 15.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest

@testable import myWater

class DateHelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_dateInDayDate() {
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = "dd.MM.yyyy HH.mm:ss"
        let date1a = dateformatter.dateFromString("15.07.1972 00:01:00")!
        let date1b = dateformatter.dateFromString("15.07.1972 23:01:00")! 
        let date2a = dateformatter.dateFromString("31.12.2001 00:00:22")!
        let date2b = dateformatter.dateFromString("31.12.2001 00:00:23")!

        
        
        XCTAssertTrue(date1a.isSameDayAs(date1a))
    /*
        
        XCTAssertTrue(date1b.isSameDayAs(date1b))
        XCTAssertFalse(date2a.isSameDayAs(date1b))
        XCTAssertTrue(date2a.isSameDayAs(date2b))
        */
        
        
        
        let date1 = NSDate()
        XCTAssertTrue(date1.isSameDayAs(NSDate()))
        
        
    }
    
}

