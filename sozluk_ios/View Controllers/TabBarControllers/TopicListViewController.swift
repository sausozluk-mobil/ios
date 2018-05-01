//
//  TopicListViewController.swift
//  sozluk_ios
//
//  Created by mahmut akyol on 28.04.2018.
//  Copyright © 2018 mahmut akyol. All rights reserved.
//

import UIKit
import Moya
import ObjectMapper
import Moya_ObjectMapper

class TopicListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIViewController.getScreenSize().width, height: 80))
    var headerLabel: UILabel = UILabel(frame: CGRect(x: 10, y: 15, width: UIViewController.getScreenSize().width * 0.6, height: 50))
    let topicListView: UITableView = UITableView(frame: CGRect(x: 0, y: 20, width: UIViewController.getScreenSize().width, height: UIViewController.getScreenSize().height), style: .plain)
    
    var titleCount: Int = 0
    var mainTopics = [Topic]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setTableHeaderView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let sv = UIViewController.displaySpinner(onView: self.view)
        NetworkAdapter.request(target: .topics(count: 20), success: { (response) in
            // parse your data
            do {
                self.mainTopics = (try response.mapObject(Topics.self).data?.topics)!
                // do something with cameras
                
                self.view.addSubview(self.topicListView)
                
                UIViewController.removeSpinner(spinner: sv)
            } catch {
                // can't parse data, show error
            }
        }, error: { (error) in
            // show error from server
        }, failure: { (error) in
            // show Moya error
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    // MARK: - DELEGATE FUNCTIONS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTopics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SimpleTableViewCell", owner: self, options: nil)?.first as! SimpleTableViewCell
        let title = mainTopics[indexPath.row].title
        let count = mainTopics[indexPath.row].count
        
        cell.lblTitle.text = title
        
        if count != 0 {
            cell.lblCount.text = String(count!)
        }
        else {
            cell.lblCount.text = ""
        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(mainTopics[indexPath.row].id ?? 0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    // MARK: - PUBLIC FUNCTIONS
    
    func setTableView() {
        topicListView.delegate = self
        topicListView.dataSource = self
        topicListView.register(SimpleTableViewCell.self, forCellReuseIdentifier: "simpleCell")
        self.topicListView.sectionHeaderHeight = 80
    }
    
    func setTableHeaderView() {
        headerView.backgroundColor = .white
        self.headerLabel.text = "bugün"
        self.headerLabel.font = UIFont(name: headerLabel.font.fontName, size: 40)
        self.headerView.layer.opacity = 0.9
        self.headerView.addSubview(headerLabel)
    }
    
    // MARK: - PRIVATE FUNCTIONS
    
    private func findShadowImage(under view: UIView) -> UIImageView? {
        if view is UIImageView && view.bounds.size.height <= 1 {
            return (view as! UIImageView)
        }
        
        for subview in view.subviews {
            if let imageView = findShadowImage(under: subview) {
                return imageView
            }
        }
        return nil
    }

}
