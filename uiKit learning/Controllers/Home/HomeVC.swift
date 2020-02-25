//
//  tab_HomeController.swift
//  uiKit learning
//
//  Created by Trent Bowden on 10/2/20.
//  Copyright © 2020 Trent Bowden. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationItem.hidesBackButton = true;
        
        self.view.backgroundColor = .yellow
        self.title = "Home"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
