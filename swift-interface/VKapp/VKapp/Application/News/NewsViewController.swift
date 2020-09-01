//
//  NewsViewController.swift
//  VKapp
//
//  Created by Marat on 01.09.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")

    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        
        newsCell.avatarImage.image = UIImage(named: "pic1")
        newsCell.nameLabel.text
         = "Нина"
        newsCell.dateLabel.text = "01.09.2020"
        newsCell.textArea.text = "Новости дополняются"
        newsCell.newsImageView.image = UIImage(named: "nature")
        return newsCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800.0
    }
    
    
}
