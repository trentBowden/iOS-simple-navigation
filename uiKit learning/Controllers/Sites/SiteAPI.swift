//
//  SiteAPI.swift
//  uiKit learning
//
//  Created by Trent Bowden on 18/2/20.
//  Copyright © 2020 Trent Bowden. All rights reserved.
//

import Foundation
class SitesAPI {
 static func getSites() -> [Site]{
   let sites = [
     Site(name: "Haighs burnside", address: "447 Portrush road", description: "Chocolate Shop", image: "building", siteID: 2, lat: -34.944640, lon: 138.621700),
     Site(name: "Foodland", address: "177 Glen Osmond Rd, Frewville SA 5063", description: "Food Shop", image: "building", siteID: 3, lat: -34.943500, lon: 138.620510),
     Site(name: "London", address: "181 Piccadilly, St. James's", description: "Food Shop", image: "building", siteID: 4, lat: 51.5083, lon: -0.1384)
    ]
   return sites
  }
}
