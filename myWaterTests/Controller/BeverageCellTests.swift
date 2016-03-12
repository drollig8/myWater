//
//  BeverageCellTests.swift
//  myWater
//
//  Created by Marc Felden on 12.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest
@testable import myWater
class BeverageCellTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureCell_SetsName() {
        let cell = BeverageCell()
        cell.configureCellWithItem(Beverage(name: "test333"))
        XCTAssertEqual(cell.textLabel.text,"test333")
    }
    
    func testConfigureCell_SetsIcon() {
        let cell = BeverageCell()
        cell.configureCellWithItem(Beverage(name: "test333", imageName: "water"))
        let image = UIImage(named: "water")
        XCTAssertEqual(cell.imageView.image,image)
    }

}
