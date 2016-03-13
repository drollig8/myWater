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
        XCTAssertEqual(sut.view.subviews.count, 5)
        let selectionView = sut.view.subviews.last as? SelectionView
        XCTAssertNotNil(selectionView)
    }
    
    func testSelectionView_HasSameWidthAsSUT() {
        sut.addEntry(UIButton())
        let selectionView = sut.view.subviews.last as? SelectionView
        XCTAssertEqual(selectionView?.frame.width, sut.view.frame.width)
    }
    
    // geht nicht, weil das animiert wird.
    func DIStestSelectionView_HasTweoThirdHeightOfSuperView() {
        sut.addEntry(UIButton())
        let selectionView = sut.view.subviews.last as? SelectionView
        XCTAssertEqual(selectionView?.frame.height, sut.view.frame.height)
        XCTAssertEqual(selectionView?.frame.origin.y, sut.view.frame.height*1/3)
    }

    func testMainViewController_AddsDismissButton() {
        let numberOfSubviews = sut.view.subviews.count
        sut.addEntry(UIButton())
        XCTAssertEqual(sut.view.subviews.count,numberOfSubviews + 2)
        
    }
    
    func testMainViewController_DismissesSelectionViewAndButton() {
        sut.addEntry(UIButton())
        let numberOfSubviews = sut.view.subviews.count
        sut.dissmissSelectionView()
        XCTAssertEqual(sut.view.subviews.count, numberOfSubviews - 1)
    }
    
    func testMainViewController_DismissesViewAndButtonOnNotification() {
        sut.addEntry(UIButton())
        let numberOfSubviews = sut.view.subviews.count
        NSNotificationCenter.defaultCenter().postNotificationName("DismissSelectionView", object: self)
             XCTAssertEqual(sut.view.subviews.count, numberOfSubviews - 1)
        
    }

    

}
