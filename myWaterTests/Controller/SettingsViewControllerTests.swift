//
//  SettingsViewControllerTests.swift
//  myWater
//
//  Created by Marc Felden on 16.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest

@testable import myWater

class SettingsViewControllerTests: XCTestCase {
    
    var sut: SettingsViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewControllerWithIdentifier("SettingsViewController") as! SettingsViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_SettingsHasTitle_Label() {
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertEqual(sut.titleLabel.text, "Einstellungen")
    }
    
    func test_SettingsHasDarkBlueNavigationBarSimulation() {
        XCTAssertNotNil(sut.customNavigationBar)
    }
    
    func testStatusbar_IsWhite() {
        // untestable
    }
    
    func testSettingssHas_SpeichernButton() {
        XCTAssertNotNil(sut.saveButton)
    }
    
    func testSaveButton_HasTargetSelf() {
        let button = sut.saveButton
        XCTAssertTrue(button.targetForAction("save:", withSender: UIButton()) === sut)
    }
    
    func testSettings_HasTable() {
        XCTAssertNotNil(sut.tableView)
    }
}

