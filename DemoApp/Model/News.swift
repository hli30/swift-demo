//
//  News.swift
//  DemoApp
//
//  Created by Harry Li on 2019-04-28.
//  Copyright © 2019 Harry. All rights reserved.
//

import Foundation

struct News : Codable {
    let title: String
    let source: String
    let publishedAt: Date
    let content: String?
}
