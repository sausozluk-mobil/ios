//
//  LoginViewController.swift
//  sozluk_ios
//
//  Created by mahmut akyol on 28.04.2018.
//  Copyright © 2018 mahmut akyol. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(txtEmail)
        view.addSubview(txtPassword)
        view.setNeedsUpdateConstraints()
    }
    
    // MARK: - CONSTRAINTS
    func txtEmailFieldConstraints() {
        
        // Center Text Field Relative to Page View
        NSLayoutConstraint(item: txtEmail, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        
        // Set Text Field Width to be %80 of the Width of the Page View
        NSLayoutConstraint(item: txtEmail, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.8, constant: 0.0).isActive = true
        
        // Set Text Field Y Position %10 Down From the Top of the Page View
        NSLayoutConstraint(item: txtEmail, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 0.35, constant: 0.0).isActive = true
    }
    
    func txtPasswordFieldConstraints() {
        
        // Center Text Field Relative to Page View
        NSLayoutConstraint(item: txtPassword, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        
        // Set Text Field Width to be %80 of the Width of the Page View
        NSLayoutConstraint(item: txtPassword, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.8, constant: 0.0).isActive = true
        
        // Set Text Field Y Position %10 Down From the Top of the Page View
        NSLayoutConstraint(item: txtPassword, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 0.45, constant: 0.0).isActive = true
    }
    
    // MARK: - OVERRIDE FUNCTIONS
    override func updateViewConstraints() {
        txtEmailFieldConstraints()
        txtPasswordFieldConstraints()
        super.updateViewConstraints()
    }
    
    // MARK: - LAZY VARIABLES
    lazy var txtEmail: UITextField! = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.layer.borderColor = UIColor(red:0.33, green:0.64, blue:0.27, alpha:1.0).cgColor
        view.layer.borderWidth = 2
//        view.layer.backgroundColor = UIColor
        view.textAlignment = .center
        
        return view
    }()
    
    lazy var txtPassword: UITextField! = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.layer.borderColor = UIColor(red:0.33, green:0.64, blue:0.27, alpha:1.0).cgColor
        view.layer.borderWidth = 2
        view.textAlignment = .center
        
        return view
    }()

}
