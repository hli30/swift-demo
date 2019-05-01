//
//  NewsPresenter.swift
//  DemoApp
//
//  Created by Harry Li on 2019-04-30.
//  Copyright © 2019 Harry. All rights reserved.
//

import Foundation

protocol NewsTableViewDelegate: NSObjectProtocol {
    func setNewsItems(newsItems: [News])
}

class NewsPresenter {
    private let newsService: NewsDataService
    private var newsTableViewDelegate: NewsTableViewDelegate?
    
    init(newsService: NewsDataService) {
        self.newsService = newsService
    }
    
    func setViewDelegate(newsTableViewDelegate: NewsTableViewDelegate) {
        self.newsTableViewDelegate = newsTableViewDelegate
    }
 
    func getNewsItems() {
        newsService.fetchNews { (data, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else {
                print("no data")
                return
            }
            
            let newsItems = self.newsService.parseDataToNewsItems(data: data)
            self.newsTableViewDelegate?.setNewsItems(newsItems: newsItems ?? [])
        }
    }
}
