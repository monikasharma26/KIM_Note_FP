//
//  NoteTVC.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-27.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NoteTVC: UITableViewCell {

    
    
    @IBOutlet var dtlbl: UILabel!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var descLbl: UILabel!
    
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var catLbl: UILabel!
    let locationManager = CLLocationManager()
        let regionInMeters: Double = 1000
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            // Styles
          //  cellview.backgroundColor = UIColor(patternImage: UIImage(named: "splash.jpg")!)
           
            
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

        }
        
        func configureCell(note: Note) {
            
            self.titleLbl.text = note.noteName?.uppercased()
            self.descLbl.text = note.noteDescription
            self.catLbl.text = note.noteCategory
        
            self.dtlbl.text = note.noteDate
            let location = CLLocationCoordinate2DMake(note.noteLat, note.noteLong);
            let region = MKCoordinateRegion(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            self.mapView.setRegion(region, animated: true)
            let dropPin = MKPointAnnotation();
            dropPin.coordinate = location;
            self.mapView.addAnnotation(dropPin);
        }

      
    }

