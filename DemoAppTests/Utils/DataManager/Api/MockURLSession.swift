//
//  MockURLSession.swift
//  DemoAppTests
//
//  Created by Harry Li on 2019-04-29.
//  Copyright © 2019 Harry. All rights reserved.
//

import Foundation

class MockURLSession: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    var cachedUrl: URL?
    var data: Data?
    var error: Error?
    
    override func dataTask(with url: URL, completionHandler: @escaping CompletionHandler)-> URLSessionDataTask {
        self.cachedUrl = url
        let data = self.data
        let error = self.error
        
        return MockURLSessionDataTask {
            completionHandler(data, nil, error)
        }
    }
}
