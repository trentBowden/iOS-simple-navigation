//
//  TabController.swift
//  uiKit learning
//
//  Created by Trent Bowden on 10/2/20.
//  Copyright © 2020 Trent Bowden. All rights reserved.
//

import Foundation
import UIKit
class TabbedController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true;
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // View controllers
        let homeVC = HomeController()
        let mapVC = MapController()
        let overflowVC = OverFlowController()
        
        // Tab items
        
        let homeTab = UITabBarItem()
        homeTab.title = "Home"
        homeTab.image = #imageLiteral(resourceName: "Ion_ios_home")
        homeVC.tabBarItem = homeTab
        homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 11, bottom: 9, right: 9)
        
        let mapTab = UITabBarItem()
        mapTab.title = "Map"
        mapTab.image = #imageLiteral(resourceName: "FA_Compass")
        mapVC.tabBarItem = mapTab
        mapVC.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let overflowTab = UITabBarItem()
        overflowTab.title = "More"
        overflowTab.image = #imageLiteral(resourceName: "Ion_ios_menu")
        overflowVC.tabBarItem = overflowTab
        overflowVC.tabBarItem.imageInsets = UIEdgeInsets(top: 7, left: 10, bottom: 7, right: 7)
        
        // Attach all tabs to the tab controller
        self.viewControllers = [homeVC, mapVC, overflowVC]
        self.selectedIndex = 0;
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}
