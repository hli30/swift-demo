//
//  NewsDataManager.swift
//  DemoApp
//
//  Created by Harry Li on 2019-04-29.
//  Copyright © 2019 Harry. All rights reserved.
//

import Foundation

class NewsDataManager {
    var session: URLSession!
    private let url: URL! = URL(string: "https://localhost:8080/v1/headlines")
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchNews(completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = session.dataTask(with: url) { data, _, error in
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            
            guard let data = data else { return }
            completionHandler(data, nil)
        }
        
        task.resume()
    }
    
    func parseDataToNewsItems(data: Data) -> [News] {
        let newsItems = try? JSONDecoder().decode(News.self, from: data)
        print("\(newsItems!)")
        
        return [newsItems!]
    }
}
