//
//  NewsTableViewControllerTests.swift
//  DemoAppTests
//
//  Created by Harry Li on 2019-04-30.
//  Copyright © 2019 Harry. All rights reserved.
//

import XCTest
@testable import DemoApp

class NewsTableViewControllerTests: XCTestCase {
    var sut: NewsTableViewController!
    
    override func setUp() {
        super.setUp()
        sut = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsTableViewConrollerID") as! NewsTableViewController)
    }
    
    // MARK: Nil Checks
    func testNewsTableVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.tableView)
    }
}
