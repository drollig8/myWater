//
//  SelectionViewTests.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest

@testable import myWater
class SelectionViewTests: XCTestCase {

    var sut:SelectionView!
    
    override func setUp() {
        super.setUp()
        sut = SelectionView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    // PageView Tests
    
    func test_stackVC_ContainsTwoViewController() {
        XCTAssertEqual(sut.stackVC.count, 2)
    }
    
    func test_stackVC_ContainsTwoPageViewController() {
        XCTAssertEqual(sut.stackPageVC.count, 2)
    }
    
    
    func testSelectionViewHasPageView() {
    XCTAssertNotNil(sut.pageViewController)
    }

    func testPageViewControllerHasDelegate() {
        XCTAssertNotNil(sut.pageViewController.dataSource)
        XCTAssertTrue(sut.pageViewController.dataSource === sut)
    }
    
    func testSelectionViewHasSubviewPageViewController() {
        XCTAssertEqual(sut.subviews.count,1)
    }

    
    // we need now to test that each and every viewcontroller has it's collection view.
    
    func testSelectionViewDidLoad_SetCollectionView() {
        let contentVC = sut.stackVC[0] as! ContentViewController
        XCTAssertNotNil(contentVC.collectionView)
    }
    
    func testSelectionView_HasDataSource() {
        let contentVC = sut.stackVC[0] as! ContentViewController
        XCTAssertNotNil(contentVC.collectionView.dataSource)
    }
    
    func testSelectionView_HasDelegate() {
        let contentVC = sut.stackVC[0] as! ContentViewController
        XCTAssertNotNil(contentVC.collectionView.delegate)
    }
    
    func testNumberOfRows() {
        let contentVC = sut.stackVC[0] as! ContentViewController
        XCTAssertNotNil(contentVC.collectionView.delegate)
        XCTAssertEqual(contentVC.collectionView.dataSource?.collectionView(contentVC.collectionView, numberOfItemsInSection: 0), 3)
    }

}



