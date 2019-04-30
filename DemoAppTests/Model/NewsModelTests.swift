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
    
    func testInit_NewsWithTitleSourceDateContent() {
        let currentDateTime = Date()
        let newsItem = News(title: "TestTitle", source: "TestSource", publishedAt: currentDateTime, content: "TestContent")
        
        XCTAssertNotNil(newsItem)
        XCTAssertEqual(newsItem.title, "TestTitle")
        XCTAssertEqual(newsItem.source, "TestSource")
        XCTAssertEqual(newsItem.publishedAt, currentDateTime)
        XCTAssertEqual(newsItem.content, "TestContent")
    }
}
