//
//  ViewController.swift
//  MapFinderPersonalLocation
//
//  Created by Kobie Nikka on 3/26/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var kobieLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var distance: Double?
    
    let HOME_LAT = 34.082510
    let HOME_LONG = -118.435210
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distanceLabel.text = "How far are you from Kobie's house?"
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        let homeCoord = CLLocationCoordinate2D(latitude: HOME_LAT, longitude: HOME_LONG)
        let point = MKMapPoint(homeCoord)
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
    
    @IBAction func findMe(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let homeLoc = CLLocationCoordinate2D(latitude: HOME_LAT, longitude: HOME_LONG)
        let homePoint = MKMapPoint(homeLoc)
        if rect.contains(homePoint) {
            kobieLabel.text = "Kobie's at home!"
        } else {
            kobieLabel.text = "Where's Kobie?"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = mapView.region.span
        print(span)
        let coords = locations.suffix(1)[0].coordinate
        let newRegion = MKCoordinateRegion(center: coords, span: span)
        mapView.setRegion(newRegion, animated: true)
//    users locations
        var personalLat = coords.latitude
        var personalLong = coords.longitude
        
        let locationOne = CLLocation(latitude: personalLat, longitude: personalLong)
        let locationTwo = CLLocation(latitude: HOME_LAT,longitude: HOME_LONG)
        
        distance = locationOne.distance(from: locationTwo) * 0.000621371
        distanceLabel.text = "You are \(Int(round(distance!)))mi from Kobies' house"
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}

