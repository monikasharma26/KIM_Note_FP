//
//  NoteLocationVC.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-26.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import  CoreLocation
import CoreData
import MapKit
class NoteLocationVC: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    var lat:Double?
    var long:Double?
    
    var locationmanager = CLLocationManager()
    
    let regionRadius: CLLocationDistance = 1000
    
    @IBOutlet var myMapView: MKMapView!
    
    override func viewDidLoad() {
        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()
        
        myMapView.showsUserLocation = true
     
        let noteLocation = CLLocation(latitude: lat!, longitude: long!)
          super.viewDidLoad(); self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "Note Location"
        
        let coordinateRegion = MKCoordinateRegion(center: noteLocation.coordinate, latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        self.myMapView.setRegion(coordinateRegion, animated: true)
    
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(noteLocation.coordinate.latitude, noteLocation.coordinate.longitude);
        myAnnotation.title = "Note Source"
        myAnnotation.subtitle = "\(String(describing: lat)),\(String(describing: long))"
        self.myMapView.addAnnotation(myAnnotation)
     
    }
    

   
}
