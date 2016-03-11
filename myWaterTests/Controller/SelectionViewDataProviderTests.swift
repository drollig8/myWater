//
//  SelectionViewDataProviderTests.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest

@testable import myWater

class SelectionViewDataProviderTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDataProvider_ReturnsThreeRows() {
        let sut = SelectionDataProvider()
        let collectionView = UICollectionView(frame: CGRectMake(0, 0, 0, 0), collectionViewLayout: UICollectionViewFlowLayout())
        XCTAssertEqual(sut.collectionView(collectionView, numberOfItemsInSection: 0), 3)
    }
   

}
