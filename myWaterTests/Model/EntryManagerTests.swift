//
//  EntryManagerTests.swift
//  myWater
//
//  Created by Marc Felden on 15.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//


import XCTest

@testable import myWater

class EntryManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_allEntriesReturnsAllEntries() {
        let sut = EntryManager()
        XCTAssertEqual(sut.entriesCount(), 0)
        sut.addEntry(Entry(date: NSDate()))
        XCTAssertEqual(sut.entriesCount(), 1)
    }
    
    
    func test_canGetEntriesForDayWithDate() {
        let sut = EntryManager()
        sut.addEntry(Entry(date: NSDate()))
        sut.addEntry(Entry(date: NSDate()))
        XCTAssertEqual(sut.entriesCount(), 2)
        let entries = sut.entriesWithDate(NSDate())
        XCTAssertEqual(entries.count, 2)
    }

}

