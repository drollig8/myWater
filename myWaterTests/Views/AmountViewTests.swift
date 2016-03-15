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
    
    func testAmountPicker_HasDataSourceAndDelegate() {
        XCTAssertNotNil(sut.amountPicker.dataSource)
        XCTAssertNotNil(sut.amountPicker.delegate)
    }

    
    func testAmountPickerContainsCorrectValues() {
        let picker = sut.amountPicker
        let row = sut.amountPickerDataProvider.pickerView(picker, titleForRow: 0, forComponent: 0)
        XCTAssertEqual(row, "30ml (espresso)")
    }

    func testAmountViewSetsLabel_WhenItemInfoGetsSet() {
        sut.itemInfo = (item: 2, page:0)
        let beverage = BeverageManager().itemAtIndex(2, page: 0)
        let imageName = beverage.imageName
        XCTAssertEqual(sut.imageView.image, UIImage(named: imageName!))
        
    }
    
    func testAmountView_HasSegmentedControl() {
        XCTAssertNotNil(sut.segmentedControl)
    }

    func testSegmentedControl_HasValues() {
        XCTAssertEqual(sut.segmentedControl.titleForSegmentAtIndex(0), "Wählen")
        XCTAssertEqual(sut.segmentedControl.titleForSegmentAtIndex(1), "Mein")
    }
    
    func testSegmentedControl_HasActionWithTargetSelf() {
        guard let segmentedControl = sut.segmentedControl else {fatalError()}
        XCTAssertTrue(segmentedControl.targetForAction("segmentChanged", withSender: self) === sut)
    }
    
    func testActionSegmentChangedExists() {
        sut.segmentChanged()
    }
    
    func testSelectionOfMein_ShowInputTextField() {
        sut.segmentedControl.selectedSegmentIndex = 1
        sut.segmentChanged()
        XCTAssertTrue(sut.valueTextField.enabled)
    }

}
