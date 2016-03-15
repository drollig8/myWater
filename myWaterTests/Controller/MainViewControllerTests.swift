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
        XCTAssertTrue(addEntryButton.targetForAction("addEntry:", withSender: self) === sut)
    }
    
    func testAddEntry_PresentsSelectionView() {
        let coundViewsBefore = sut.view.subviews.count
   
        sut.addEntry(UIButton())
        let coundViewsAfter = sut.view.subviews.count
        XCTAssertEqual(coundViewsBefore + 2, coundViewsAfter)
   
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
    
    
    // MARK: - Button Layout
    
    // Tipp: Mach das programmatisch! Das ist viel, viel besser !! - erstmal brauchen wir keine Action.
    
    func test_HasPokalButton() {
        XCTAssertNotNil(sut.pokalButton)
    }
    
    func test_HasIdeaButton() {
        XCTAssertNotNil(sut.ideaButton)
    }
    
    func test_HasInfoButton() {
        XCTAssertNotNil(sut.infoButton)
    }
    
    func test_HasLabelHeuteHastDuGetrunken() {
        XCTAssertNotNil(sut.heuteHastDuGetrunkenLabel)
    }
    
    func test_HasPercentageLabel() {
        XCTAssertNotNil(sut.percentageLabel)
    }
    
    // MARK: - Segueing

    func testMainViewController_SetsItemInfoToAmountView() {
        
        NSNotificationCenter.defaultCenter().postNotificationName("ItemSelectedNotification", object: nil, userInfo: ["index":7,"page":9])
        
        
        XCTAssertEqual(sut.amountView.itemInfo!.item, 7)
        XCTAssertEqual(sut.amountView.itemInfo!.page, 9)
    }
    
    //TODOO !!!
    func DIStestMainViewController_PresentsAmountViewWhenItemWasSelected() {
        sut.addEntry(UIButton())
        guard let _ = sut.view.subviews.last as? SelectionView else {fatalError()}
        NSNotificationCenter.defaultCenter().postNotificationName("ItemSelectedNotification", object: self)
        let amountView = sut.view.subviews.last as? AmountView
        XCTAssertNotNil(amountView)
    }
    
    // nicht testbar, weil die view erst im completion handler entfernt wird. Wir müssten die UIAnimation überMocken.
    func DIStestMainViewController_DismissesAmountView() {

      /*
        sut.amountView = UIView()
        sut.view.addSubview(sut.amountView)
        sut.selectionView = UIView()
        sut.view.addSubview(sut.selectionView)
        let numberOfSubviews = sut.view.subviews.count
        sut.dismissAmountView()
        //NSNotificationCenter.defaultCenter().postNotificationName("DismissAmountView", object: self)
        XCTAssertEqual(sut.view.subviews.count, numberOfSubviews - 1)
*/
    }
}
