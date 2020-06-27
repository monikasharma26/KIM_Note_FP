//
//  NotesTableViewCell.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-26.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import MapKit

class NotesTableViewCell: UITableViewCell {
    
   @IBOutlet var containView: UIView!
    @IBOutlet var innerView: UIView!

          @IBOutlet var type_img: UIImageView!
          @IBOutlet var day_lbl: UILabel!
          @IBOutlet var catLbl: UILabel!
          @IBOutlet var type_lbl: UILabel!
          @IBOutlet var upDown_img: UIImageView!
          
          @IBOutlet var desc_view: UIView!
   
          
        @IBOutlet var descp_lbl: UILabel!
    
    @IBOutlet var catogrylbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!
        let locationManager = CLLocationManager()
    let regionInMeters: Double = 1000
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
         
    }
    
    // MARK: - Helper
    func setDisplay(note: Note) {
        self.type_lbl.text = note.noteName?.uppercased()
        print("check\(note.noteName)")
            self.descp_lbl.text = note.noteDescription
            self.catLbl.text = note.noteCategory
        //    self.type_img.image = UIImage(data: (note.noteImage ) as Data)
            self.day_lbl.text = note.noteDate
            let location = CLLocationCoordinate2DMake(note.noteLat, note.noteLong);
            let region = MKCoordinateRegion(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            self.mapView.setRegion(region, animated: true)
            let dropPin = MKPointAnnotation();
            dropPin.coordinate = location;
            self.mapView.addAnnotation(dropPin);
        }
    

}
