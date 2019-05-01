//
//  NewsTableViewController.swift
//  DemoApp
//
//  Created by Harry Li on 2019-04-30.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    @IBOutlet var NewsTableView: UITableView!
    
    private let newsPresenter = NewsPresenter(newsService: NewsDataService())
    private var newsToDisplay = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        newsPresenter.setViewDelegate(newsTableViewDelegate: self)
        newsPresenter.getNewsItems()
    }
}

// MARK: Data Source
extension NewsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsToDisplay.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = indexPath.row % 2 == 0 ? .white : .gray
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsItemCell", for: indexPath) as! NewsTableViewCell
        let newsItemData = newsToDisplay[indexPath.row]
        
        // Alternate cell color
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .white
        
        cell.headlineLabel.text = newsItemData.title
        cell.sourceLabel.text = "Source: \(newsItemData.source)"
        
        return cell
    }
}

extension NewsTableViewController: NewsTableViewDelegate {
    func setNewsItems(newsItems: [News]) {
        newsToDisplay = newsItems
        DispatchQueue.main.async(execute: { () -> Void in
            self.tableView.reloadData()
        })
    }
}

