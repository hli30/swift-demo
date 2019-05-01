//
//  NewsDataManagerTests.swift
//  DemoAppTests
//
//  Created by Harry Li on 2019-04-28.
//  Copyright © 2019 Harry. All rights reserved.
//

import XCTest
@testable import DemoApp

class NewsDataServiceTests: XCTestCase {
    let mockURLSession = MockURLSession()
    let sut = NewsDataService()
    
    // MARK: Initializer
    func testInit_NewsDataManager() {
        XCTAssertNotNil(sut)
    }
    
    // MARK: FetchNews
    func testFetchNewsWithExpectedURLHostAndPath() {
        let sut = NewsDataService(session: mockURLSession)
        sut.fetchNews {(newsItems, error) in }
        XCTAssertEqual(mockURLSession.cachedUrl?.host, "HLs-MacBook-Pro.local")
        XCTAssertEqual(mockURLSession.cachedUrl?.path, "/v1/headlines")
    }

    func testFetchNews_SuccessResponse_ShouldReturnData() {
        var response: Data?
        let exp = expectation(description: "Server fetch")
        let sut = NewsDataService(session: mockURLSession)
        let data = Data(base64Encoded: "TestData")
        mockURLSession.data = data
        
        sut.fetchNews {(data, error) in
            response = data
            exp.fulfill()
        }
        waitForExpectations(timeout: 2) { (error) in
            XCTAssertNotNil(response)
        }
    }
    
    func testFetchNews_FailResponse_ShouldReturnError() {
        var response: Error?
        let exp = expectation(description: "Server fetch error")
        let sut = NewsDataService(session: mockURLSession)
        let error = NSError(domain: "error", code: 1234, userInfo: nil)
        mockURLSession.error = error
        
        sut.fetchNews {(data, error) in
            response = error
            exp.fulfill()
        }
        waitForExpectations(timeout: 2) { (error) in
            XCTAssertNotNil(response)
        }
    }
    
    func testParseDataToNewsItems_ShouldReturnNewsObjects() {
        var newsItems: [News] = []
        let exp = expectation(description: "Server Fetch")
        sut.fetchNews { (data, error) in
            newsItems = self.sut.parseDataToNewsItems(data: data!)!
            exp.fulfill()
        }
        waitForExpectations(timeout: 2) { (error) in
            XCTAssertTrue(newsItems.count > 0)
        }
    }
}
