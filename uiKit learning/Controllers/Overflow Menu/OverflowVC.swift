//
//  tab_OverFlowController.swift
//  uiKit learning
//
//  Created by Trent Bowden on 20/2/20.
//  Copyright © 2020 Trent Bowden. All rights reserved.
//

import Foundation
import UIKit

class OverFlowController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    private let sites = SitesAPI.getSites() // model
    
    override func loadView() {
        
        // Setup
        super.loadView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SiteTableViewCell.self, forCellReuseIdentifier: "sitesCell")

        // Table related things
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }
    
    // Setting up the table information
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sitesCell", for: indexPath) as! SiteTableViewCell

//        cell.textLabel?.text = sites[indexPath.row].name
        cell.site = sites[indexPath.row]
        return cell
    }
    
    func setupTableView() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationItem.hidesBackButton = true;
        
        self.view.backgroundColor = .white
        self.title = "More"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
