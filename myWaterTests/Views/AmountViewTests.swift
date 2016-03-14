//
//  AmountViewTests.swift
//  myWater
//
//  Created by Marc Felden on 14.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest

@testable import myWater

class AmountViewTests: XCTestCase {

    var sut: AmountView!
    
    override func setUp() {
        super.setUp()
        sut = AmountView(frame: CGRect(x: 0, y: 0, width: 127, height: 328))
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testAmountView_HasOkButton() {
        XCTAssertNotNil(sut.okButton)
    }
    
    func testOkButton_HasActionWithTargetSelf() {
        
        XCTAssertNotNil(sut.okButton)
        guard let okButton = sut.okButton else {fatalError()}
        XCTAssertTrue(okButton.targetForAction("ok", withSender: self) === sut)
    }
    
    func testAmountView_HasBackButton() {
        XCTAssertNotNil(sut.backButton)
    }
    
    // ERROR: Passed imnmer !
    func testBackButton_HasActionWithTargetSelf() {
        
        XCTAssertNotNil(sut.backButton)
        guard let backButton = sut.backButton else {fatalError()}
        XCTAssertTrue(backButton.targetForAction("back", withSender: self) === sut)
    }
    
    func testSUT_HasAmountPicker() {
        XCTAssertNotNil(sut.amountPicker)
    }



}
