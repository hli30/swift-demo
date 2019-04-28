//
//  NewsModelTests.swift
//  DemoAppTests
//
//  Created by Harry Li on 2019-04-28.
//  Copyright © 2019 Harry. All rights reserved.
//

import XCTest
@testable import DemoApp

class NewsModelTests: XCTestCase {
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInit_NewsWithTitleSourceDateContent() {
        let newsItem = News(title: "TestTitle", source: "TestSource", date: "TestDate", content: "TestContent")
        
        XCTAssertNotNil(newsItem)
        XCTAssertEqual(newsItem.title, "TestTitle")
        XCTAssertEqual(newsItem.source, "TestSource")
        XCTAssertEqual(newsItem.date, "TestDate")
        XCTAssertEqual(newsItem.content, "TestContent")
    }
}
