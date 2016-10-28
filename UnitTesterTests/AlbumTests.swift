//
//  AlbumTests.swift
//  UnitTester
//
//  Created by Ludovic Perseghini on 10/28/16.
//  Copyright © 2016 LumoBodytech. All rights reserved.
//

import XCTest


class AlbumTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSaveReturnsYesIfApiCallIsSuccessful() {
        // Arrange
        let album = Album()
        
        // Act
        let res = album.save()
        
        // Assert
        XCTAssertTrue(res)
    }
    
}
