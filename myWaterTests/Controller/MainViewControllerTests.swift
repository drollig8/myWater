//
//  MainViewControllerTests.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest

@testable import myWater

class MainViewControllerTests: XCTestCase {

    var sut: MainViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewControllerWithIdentifier("MainViewController") as! MainViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }

    
    func testMainVC_HasButton() {

        XCTAssertNotNil(sut.addEntryButton)
    }
    
    func testAddEntry_HasActionWithTargetSelf() {

        XCTAssertNotNil(sut.addEntryButton)
        guard let addEntryButton = sut.addEntryButton else {fatalError()}
        
        print(addEntryButton.actionsForTarget(addEntryButton, forControlEvent: .TouchUpInside))
        XCTAssertTrue(addEntryButton.targetForAction("addEntry:", withSender: self) === sut)
    }
    
    func testAddEntry_PresentsSelectionView() {
        XCTAssertEqual(sut.view.subviews.count, 3)
        sut.addEntry(UIButton())
        XCTAssertEqual(sut.view.subviews.count, 4)
        let selectionView = sut.view.subviews.last as? SelectionView
        XCTAssertNotNil(selectionView)
    }
    
    func testSelectionView_HasSameWidthAsSUT() {
        sut.addEntry(UIButton())
        let selectionView = sut.view.subviews.last as? SelectionView
        XCTAssertEqual(selectionView?.frame.width, sut.view.frame.width)
    }
    
    func testSelectionView_HasHalfHeightOfSuperView() {
        sut.addEntry(UIButton())
        let selectionView = sut.view.subviews.last as? SelectionView
        XCTAssertEqual(selectionView?.frame.height, sut.view.frame.height/2)
        XCTAssertEqual(selectionView?.frame.origin.y, sut.view.frame.height/2)
    }

    

    

}
