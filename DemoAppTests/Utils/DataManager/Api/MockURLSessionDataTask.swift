//
//  MockTask.swift
//  DemoAppTests
//
//  Created by Harry Li on 2019-04-29.
//  Copyright © 2019 Harry. All rights reserved.
//

import Foundation

class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
