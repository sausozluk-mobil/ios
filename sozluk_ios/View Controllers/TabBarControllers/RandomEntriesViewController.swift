//
//  RandomEntriesViewController.swift
//  sozluk_ios
//
//  Created by mahmut akyol on 28.04.2018.
//  Copyright © 2018 mahmut akyol. All rights reserved.
//

import UIKit

class RandomEntriesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: UIViewController.getScreenSize().width, height: 44))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "SomeTitle");
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: "selector");
        navItem.rightBarButtonItem = doneItem;
        navBar.setItems([navItem], animated: false);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
