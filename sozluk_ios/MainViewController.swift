//
//  MainViewController.swift
//  sozluk_ios
//
//  Created by mahmut akyol on 27.04.2018.
//  Copyright © 2018 mahmut akyol. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    var tabBarViews: [UIViewController] = []
    
    enum TabBarViewControllers: String {
        case shuffle = "Ortaya Karışık"
        case today = "Bugün"
        case search = "Ara"
        case profile = "Profil"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBar.barTintColor = UIColor(red: (36 / 255.0), green: (27 / 255.0), blue: (112 / 255.0), alpha: 100)
        self.tabBar.tintColor = UIColor.white
        self.createTabViewController(names: ["Ortaya Karışık", "Bugün", "Ara", "Profil"], backgroundColor: .white)
        print(tabBarViews.count)
        print("tabBar çalıştı")
        self.viewControllers = self.tabBarViews
        
    }
    
    // MARK: - DELEGATE METHODS
    
    // MARK: - ACTION METHODS
    
    // MARK: - CONSTRAINTS
    
    // MARK: - OVERRIDE FUNCTIONS
    
    // MARK: - LAZY VARIABLES
    
    // MARK: - CREATE TAB VIEW CONTROLLERS
    
    func createTabViewController(names: [String], backgroundColor: UIColor) {
        
        var tabBarVC = TabBarViewControllers.shuffle
        
        for name in names {
            
            let tabViewController: UIViewController
            tabBarVC = TabBarViewControllers(rawValue: name)!
            switch tabBarVC {
            case .shuffle:
                 tabViewController = RandomEntriesViewController()
            case .today:
                tabViewController = TopicListViewController()
            case .search:
                tabViewController = SearchViewController()
            case .profile:
                tabViewController = ProfileViewController()
            }
            
            tabViewController.title = name
            tabViewController.view.backgroundColor = backgroundColor
            tabViewController.tabBarItem = UITabBarItem(title: name, image: UIImage(named: name), tag: self.tabBarViews.count)
            self.tabBarViews.append(tabViewController)
        }
        
    }
    

    // MARK: - TAB BAR ITEMS
}
