//
//  ContentViewControllerTests.swift
//  myWater
//
//  Created by Marc Felden on 12.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest

@testable import myWater

class ContentViewControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testContentViewHasSameWidth_AsCollectionView() {
        let contentViewController =  ContentViewController()
        let contentViewControllerFrame = contentViewController.view.frame
        let collectionViewFrame = contentViewController.collectionView.frame
        XCTAssertEqual(contentViewControllerFrame.width, collectionViewFrame.width)
    }

}
