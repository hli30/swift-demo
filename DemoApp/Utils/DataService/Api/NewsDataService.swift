//
//  NewsDataService.swift
//  DemoApp
//
//  Created by Harry Li on 2019-04-29.
//  Copyright © 2019 Harry. All rights reserved.
//

import Foundation

class NewsDataService {
    var session: URLSession!
    private let url: URL! = URL(string: "http://HLs-MacBook-Pro.local:8080/v1/headlines")
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // Networking fetch
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
    
    // Translation to News objects
    func parseDataToNewsItems(data: Data) -> [News]? {
        var newsItems: [News] = []
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            newsItems = try decoder.decode([News].self, from: data)
        } catch {
            print(error)
            return nil
        }
        
        return newsItems
    }
}
