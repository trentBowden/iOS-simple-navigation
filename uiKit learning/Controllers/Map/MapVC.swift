//
//  tab_MapController.swift
//  uiKit learning
//
//  Created by Trent Bowden on 10/2/20.
//  Copyright © 2020 Trent Bowden. All rights reserved.
//

// The list of places should have a UISegmentedControl

import Foundation
import UIKit
import MapKit
import Contacts

class MapController: UIViewController, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate {
    let tableView = UITableView()
    let mapView = MKMapView()
    var safeArea: UILayoutGuide!
//    var segmentedControl = UISegmentedControl()
    private let sites = SitesAPI.getSites() // model

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            break // Uno
        case 1:
            break // Dos
        case 2:
            break // Tres
        default:
            break
        }
    }
    
    override func loadView() {
        super.loadView()
        
        // Customisation of the view
        self.view.backgroundColor = .white
        self.title = "Map"
        safeArea = view.layoutMarginsGuide
        
        /// ADD THE MAP
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        // Or, if needed, we can position map in the center of the view
//        mapView.center = view.center
        self.view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -200).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        for site in sites
        {
            let coords = CLLocationCoordinate2DMake(site.lat!, site.lon!)
            let address = [CNPostalAddressStreetKey: site.address!, CNPostalAddressCityKey: "Australia", CNPostalAddressPostalCodeKey: "5000", CNPostalAddressISOCountryCodeKey: "AUS"]
            let place = MKPlacemark(coordinate: coords, addressDictionary: address)
            mapView.addAnnotation(place)
        }
        
        // ADD THE SEGMENTED CONTROL
        let items = ["Sites", "POI", "Other"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 1
        
        self.view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: mapView.bottomAnchor).isActive = true
        segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // ADD THE TABLE

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SiteTableViewCell.self, forCellReuseIdentifier: "sitesCell")
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 70
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("test")
        let myAddress = sites[indexPath.row].address!
        print(myAddress)
        let locOfCell = CLLocation(latitude: sites[indexPath.row].lat!, longitude: sites[indexPath.row].lon!)
        let regionRadius: CLLocationDistance = 700
        let coordinateRegion = MKCoordinateRegion(center: locOfCell.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
