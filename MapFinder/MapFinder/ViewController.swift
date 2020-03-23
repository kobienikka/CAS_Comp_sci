//
//  ViewController.swift
//  MapFinder
//
//  Created by Kobie Nikka on 3/23/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var crossroadsButton: UIButton!
    @IBOutlet weak var towerButton: UIButton!
    @IBOutlet weak var chickenButton: UIButton!
    
    @IBOutlet weak var crossroadsLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    let CROSSROADS_LAT = 34.024640
    let CROSSROADS_LONG = -118.473630
    
    let TOWER_LAT = 48.858372
    let TOWER_LONG = 2.294481
    
    let CHICKEN_LAT = 34.063460
    let CHICKEN_LONG = -118.445080
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToCrossroads(_ sender: Any) {
        mapView.delegate = self
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func goToEiffelTower(_ sender: Any) {
        mapView.delegate = self
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: TOWER_LAT, longitude: TOWER_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func goToChicken(_ sender: Any) {
        mapView.delegate = self
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: CHICKEN_LAT, longitude: CHICKEN_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func zoomOut(_ sender: Any) {
        changeZoom(1)
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        changeZoom(-1)
    }
    
    func changeZoom(_ exp: Double) {
        /*
        // Uses MKMapRect to create and set region
        let factor = pow(2, exp)
        let rect = mapView.visibleMapRect
        let newSize = MKMapSize(width: rect.width * factor, height: rect.height * factor)
        let newRect = MKMapRect(origin: rect.origin, size: newSize)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        */
        // Uses MKCoordinateSpan to create and set region
        let region = mapView.region
        let newLat = region.span.latitudeDelta * pow(2, exp)
        let newLong = region.span.longitudeDelta * pow(2, exp)
        let newCoordinateSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newCoordinateSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let crossroadsLoc = CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG)
        let crossroadsPoint = MKMapPoint(crossroadsLoc)
        
        let towerLoc = CLLocationCoordinate2D(latitude: TOWER_LAT, longitude: TOWER_LONG)
        let towerPoint = MKMapPoint(towerLoc)
        
        let chickenLoc = CLLocationCoordinate2D(latitude: CHICKEN_LAT, longitude: CHICKEN_LONG)
        let chickenPoint = MKMapPoint(chickenLoc)
        
        if rect.contains(crossroadsPoint) {
            crossroadsLabel.text = "It's Crossroads!"
            crossroadsButton.backgroundColor = UIColor(red: 0/255, green: 250/255, blue: 0/255, alpha: 0.5)
            chickenButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
            towerButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        } else if rect.contains(towerPoint) {
            crossroadsLabel.text = "It's the Eiffel Tower!"
            towerButton.backgroundColor = UIColor(red: 0/255, green: 250/255, blue: 0/255, alpha: 0.5)
            chickenButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
            crossroadsButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        } else if rect.contains(chickenPoint) {
            crossroadsLabel.text = "It's Chick Fil A!"
            chickenButton.backgroundColor = UIColor(red: 0/255, green: 250/255, blue: 0/255, alpha: 0.5)
            crossroadsButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
            towerButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        } else {
            crossroadsLabel.text = "What's this?"
            crossroadsButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
            towerButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
            chickenButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
            
        }
    }
}

