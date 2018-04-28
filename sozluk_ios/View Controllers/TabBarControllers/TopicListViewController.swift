//
//  TopicListViewController.swift
//  sozluk_ios
//
//  Created by mahmut akyol on 28.04.2018.
//  Copyright © 2018 mahmut akyol. All rights reserved.
//

import UIKit

class TopicListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var topicListView: UITableView = UITableView()
    
    let titles = ["Mahmut", "Ömer", "Ahmet", "Furkan"]
    let counts = [5, 0, 2, 1]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("girdi")
        topicListView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        topicListView.delegate = self
        topicListView.dataSource = self
        topicListView.register(SimpleTableViewCell.self, forCellReuseIdentifier: "simpleCell")
        view.addSubview(topicListView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - DELEGATE FUNCTIONS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SimpleTableViewCell", owner: self, options: nil)?.first as! SimpleTableViewCell
        let title = titles[indexPath.row]
        let count = counts[indexPath.row]
        
        cell.lblTitle.text = "Mahmut"
        cell.lblCount.text = "5"
        
        print("Hello mello")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(titles[indexPath.row])
    }

}
