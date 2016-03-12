//
//  SelectionViewDataProviderTests.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest

@testable import myWater


/*

ItemListDataProviderTests
- instantiiiert ItemListDataProvider und setzt ItemManager
- instantiiert den zugehörigen ViewController und holt sich die tableView
- tested tableView.numberOfSections
- holt sich eine Zelle und prüf, ob die nicht null ist.
- Mocked den TableView und prüft, ob cellGotDequed aufgerufen wird.
- Mocked den TableView und prüft, ob configCell gerufen wird, dazu wird dem MockTable
das SUT aus DataSource geben, der Frame gesetzt, die ZellenKlasse MockCell registriert und dort im    ConfigCell GotCalled bzw. das Item zurückgegeben.
*/

class SelectionViewDataProviderTests: XCTestCase {

    var sut: SelectionDataProvider!
    var controller: ContentViewController!
    var collectionView: UICollectionView!

    
    override func setUp() {
        super.setUp()
        sut = SelectionDataProvider()
        
        /*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        _ = controller.view
        collectionView = controller.collectionView
        */
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRectMake(0, 0, 100, 100), collectionViewLayout: layout)
        collectionView.registerClass(BeverageCell.self, forCellWithReuseIdentifier: "Cell")
        
        collectionView.dataSource = sut
    }
    
    override func tearDown() {
        super.tearDown()
    }
    

    func testDataProvider_ReturnsThreeSections() {
        let numberOfSections = collectionView.numberOfSections()
        XCTAssertEqual(numberOfSections, 3)
    }
    
    func testDataProvider_ReturnsThreeRows() {
        XCTAssertEqual(collectionView.numberOfItemsInSection(0), 3)
    }
    
    func test_CellIstNotNil() {
        let cell = sut.collectionView(collectionView, cellForItemAtIndexPath: NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertNotNil(cell)
    }
    
    func test_CellGetsDequeued() {
        let mockCollectionView = MockCollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        mockCollectionView.dataSource = sut
        mockCollectionView.registerClass(BeverageCell.self, forCellWithReuseIdentifier: "Cell")
        let cell = sut.collectionView(mockCollectionView, cellForItemAtIndexPath: NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertTrue(mockCollectionView.cellGotDequeued)
        XCTAssertTrue(cell is BeverageCell)
    }
    
    func test_ConfigCellGetsCalled() {
        let mockCollectionView = MockCollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        mockCollectionView.dataSource = sut
        mockCollectionView.registerClass(MockBeverageCell.self, forCellWithReuseIdentifier: "Cell")
        let cell = sut.collectionView(mockCollectionView, cellForItemAtIndexPath: NSIndexPath(forItem: 0, inSection: 0)) as! MockBeverageCell

        XCTAssertTrue(cell.configureCellGotCalled)
    }
    

}

extension SelectionViewDataProviderTests {
    class MockCollectionView : UICollectionView {
        
        var cellGotDequeued = false
        var cell:AnyObject!
        override func dequeueReusableCellWithReuseIdentifier(identifier: String, forIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath)
        }
        
    }
    
    class MockBeverageCell: BeverageCell {
        var configureCellGotCalled = false
        override func configureCellWithItem(beverageItem: Beverage) {
            configureCellGotCalled = true
        }
    }
}
