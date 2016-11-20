//
//  MapViewController.swift
//  AaroCare
//
//  Created by Harvey Chui on 11/19/16.
//  Copyright © 2016 AaroCare. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var mapManager: CLLocationManager!

    @IBOutlet weak var mapView: MKMapView!
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate = manager.location?.coordinate
        
        let latDelta:CLLocationDegrees = 0.04
        let longDelta:CLLocationDegrees = 0.04
        let span = MKCoordinateSpanMake(latDelta, longDelta)
        
        let region = MKCoordinateRegionMake(coordinate!, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate!
        
        annotation.title = "This is a pin"
        
        mapView.addAnnotation(annotation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapManager = CLLocationManager()
        mapManager.delegate = self
        mapManager.desiredAccuracy = kCLLocationAccuracyBest
        
        mapManager.requestWhenInUseAuthorization()
        mapManager.startUpdatingLocation()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
