//
//  ViewController.swift
//  uiKit learning
//
//  Created by Trent Bowden on 29/1/20.
//  Copyright © 2020 Trent Bowden. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    @objc func buttonAction(sender: UIButton!) {
        print("Login Button tapped: " + sender.currentTitle!)
        let tabViewController = TabbedController()
        navigationController?.pushViewController(tabViewController, animated: true)
    }
    
    private let loginContentView:UIView = {
    let view = UIView()
        view.backgroundColor = .lightGray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
    }()
    
    private let unameTxtField:UITextField = {
    let txtField = UITextField()
    txtField.backgroundColor = .white
    txtField.borderStyle = .roundedRect
    txtField.translatesAutoresizingMaskIntoConstraints = false
    return txtField
    }()
    
    private let pwordTxtField:UITextField = {
    let txtField = UITextField()
    txtField.borderStyle = .roundedRect
    txtField.translatesAutoresizingMaskIntoConstraints = false
    return txtField
    }()
    
    let btnLogin:UIButton = {
    let btn = UIButton(type:.system)
    btn.backgroundColor = .blue
    btn.setTitle("Login", for: .normal)
    btn.tintColor = .white
    btn.layer.cornerRadius = 5
    btn.clipsToBounds = true
    btn.translatesAutoresizingMaskIntoConstraints = false
        
    return btn
        
    }()
    
    func setUpAutoLayout(view: UIView) {
        // Left sticks to the wall
        loginContentView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        // Right sticks to the wall
        loginContentView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        // Height anchor is 1/3 down the screen
        loginContentView.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
        // Centered on the Y axis
        loginContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Username is tagged to the top of the login content view. + add a little bit of padding.
        unameTxtField.topAnchor.constraint(equalTo:loginContentView.topAnchor, constant:40).isActive = true
        
        // Stretch the username to go all the way left and right.
        unameTxtField.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant:20).isActive = true
        unameTxtField.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant:-20).isActive = true
        // Give a constant of 20 to create some padding.
        
        // Create some height within the text field
        unameTxtField.heightAnchor.constraint(equalToConstant:50).isActive = true

        pwordTxtField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 20).isActive=true
        pwordTxtField.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -20).isActive=true
        pwordTxtField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pwordTxtField.topAnchor.constraint(equalTo: unameTxtField.bottomAnchor, constant: 30).isActive = true
        
        btnLogin.topAnchor.constraint(equalTo: pwordTxtField.bottomAnchor, constant: 30).isActive = true
        btnLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnLogin.leftAnchor.constraint(equalTo: pwordTxtField.leftAnchor, constant: 10).isActive = true
        btnLogin.rightAnchor.constraint(equalTo: pwordTxtField.rightAnchor, constant: -10).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true;
        
        loginContentView.addSubview(unameTxtField)
        loginContentView.addSubview(pwordTxtField)
        btnLogin.tag = 5
        btnLogin.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        loginContentView.addSubview(btnLogin)
        
        view.addSubview(loginContentView)
        setUpAutoLayout(view: view)
        
        view.backgroundColor = .white
    }
}

