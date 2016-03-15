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

    // TODO: on didselect darf nur wert gesetzt werden
    // TODO: icon muss höher
    // TODO: label muss noch unter das icon
    // TODO: inaktiviere haken, wenn unter benutzerdefiniert kein Wert steht
    // TODO: haken speicher daten.
    
    func testAmountPickerContainsCorrectValues() {
        let picker = sut.amountPicker
        let row = sut.amountPickerDataProvider.pickerView(picker, titleForRow: 0, forComponent: 0)
        XCTAssertEqual(row, "30ml (espresso)")
    }

    func testAmountViewSetsImage_WhenItemInfoGetsSet() {
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
        XCTAssertFalse(sut.valueTextField.enabled)
        sut.segmentedControl.selectedSegmentIndex = 1
        sut.segmentChanged()
        XCTAssertTrue(sut.valueTextField.enabled)
    }
    
    func testDefaultValueOfPicker_is250ml() {
        let selectedDefaultRow = sut.amountPicker.selectedRowInComponent(0)
        XCTAssertEqual(selectedDefaultRow, 5)
    }
    
    func testSelectingMein_SetsFocusOnTextField() {
        let mockTextField = MockTextField()
        sut.valueTextField = mockTextField
        sut.segmentedControl.selectedSegmentIndex = 1
        sut.segmentChanged()
        XCTAssertTrue(mockTextField.hasBecomeFirstResponder)
    }
    
    func testTextField_IsRightAlignet() {
        XCTAssertEqual(sut.valueTextField.textAlignment, NSTextAlignment.Right)
    }
    
    func testTextField_IsDeleted_WhenSegmentedCahnged() {
        XCTAssertFalse(sut.valueTextField.text!.isEmpty)
        sut.segmentedControl.selectedSegmentIndex = 1
        sut.segmentChanged()
        XCTAssertTrue(sut.valueTextField.text!.isEmpty)
    }
    
    func testTextFieldContains_DefaultValue() {
        XCTAssertEqual(sut.valueTextField.text, "250")
    }
    
    func testSelectingMein_ShowsNumKeyboard() {
        XCTAssertEqual(sut.valueTextField.keyboardType, UIKeyboardType.NumberPad)
    }
    
    func testSelectingSegment_DefaultValueSelected_Is0() {
        XCTAssertEqual(sut.segmentedControl.selectedSegmentIndex, 0)
    }
    
    func testAmountView_HasUnitLabel() {
        XCTAssertNotNil(sut.unitLabel)
    }
    
    
    func testChangingAmountSelecting_ChangesTextField() {

        sut.amountPicker.selectRow(2, inComponent: 0, animated: false)
        print(sut.amountPicker.selectedRowInComponent(0))
        XCTAssertEqual(sut.valueTextField.text, "100")
    }


}

extension AmountViewTests {
    class MockTextField:UITextField {
        var hasBecomeFirstResponder=false
        override func becomeFirstResponder() -> Bool {
            hasBecomeFirstResponder=true
            return super.becomeFirstResponder()
        }
    }
}
