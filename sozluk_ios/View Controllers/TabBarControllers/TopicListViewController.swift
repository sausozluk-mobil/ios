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

    let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: UIViewController.getScreenSize().width, height: 54))
    let topicListView: UITableView = UITableView(frame: CGRect(x: 0, y: 74, width: UIViewController.getScreenSize().width, height: UIViewController.getScreenSize().height), style: .plain)
    
    var titleCount: Int = 0
    var mainTopics = [Topic]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setNavigationBar()
        
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
    
    // MARK: - PUBLIC FUNCTIONS
    
    func setTableView() {
        topicListView.delegate = self
        topicListView.dataSource = self
        topicListView.register(SimpleTableViewCell.self, forCellReuseIdentifier: "simpleCell")
    }
    
    func setNavigationBar() {
        self.navigationBar.layer.opacity = 0.8
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.isTranslucent = false
        
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIColor.red.as1ptImage()
        
        self.view.addSubview(self.navigationBar);
        
        let navItem = UINavigationItem(title: "SomeTitle");
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(getter: UIAccessibilityCustomAction.selector));
        navItem.rightBarButtonItem = doneItem;
        self.navigationBar.setItems([navItem], animated: false);
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
