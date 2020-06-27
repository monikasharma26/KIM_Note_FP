//
//  AddNoteVC.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-26.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit
 var category = ["Defaults"]
class AddNoteVC: UIViewController,UINavigationControllerDelegate,UIPickerViewDataSource, UIPickerViewDelegate,CLLocationManagerDelegate, UIImagePickerControllerDelegate{
   

   
    @IBOutlet var titleTxt: UITextField!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var dtLbl: UILabel!
    @IBOutlet var descTxt: UITextView!
    @IBOutlet var txtCat: UITextField!
    var locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
      var chosenCategory : String = ""
    var categoryPicker = UIPickerView()
    
    var managedObjectContext: NSManagedObjectContext? {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    }
    
    var notesFetchedResultsController: NSFetchedResultsController<Note>!
    var notes = [Note]()
    var note: Note?
    var isExsisting = false
    var indexPath: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: date as Date)
        dtLbl.text = dateString
        checkLocationServices()
        if let note = note {
            titleTxt.text = note.noteName
            descTxt.text = note.noteDescription
            txtCat.text = note.noteCategory
            imgView.image = UIImage(data: note.noteImage! as Data)

        }
        
        if titleTxt.text != "" {
            isExsisting = true
        }
        

        categoryPicker.dataSource = self
              categoryPicker.delegate = self
              
             txtCat.inputView = categoryPicker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
       }
    
    
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return category[row]
      }
      
   
      
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          txtCat.text = category[row]
          self.chosenCategory = category[row]
          self.txtCat.resignFirstResponder()
      }
       
    

    // Core data
    func saveData(completion: @escaping ()->Void){
        managedObjectContext!.perform {
            do {
                try self.managedObjectContext?.save()
                completion()
                
            }
            
            catch let error {
                print(error.localizedDescription)
                
            }
            
        }
        
    }
    @IBAction func addCatogry(_ sender: Any) {
        let alert = UIAlertController(title: "Category", message: "Add Category", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            category.append(textField!.text!)

            UserDefaults.standard.set(category, forKey: "Category")
        }))

     
        self.present(alert, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func addAudio(_ sender: Any) {
      //  let obj = self.storyboard?.instantiateViewController(withIdentifier: "RecordingVC") as! RecordingVC
                           //  self.present(obj, animated: true, completion: nil)
    }
    
    func openDialog(){
           let alert = UIAlertController(title: "Note", message: "Pick image from", preferredStyle: .alert)
           
           
           
           alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
               
               if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                   imagePicker.delegate = self
                   imagePicker.sourceType = .camera;
                   imagePicker.allowsEditing = false
                   self.present(imagePicker, animated: true, completion: nil)
               }
           }))
           alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { action in
               
               
               if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                   imagePicker.delegate = self
                   imagePicker.sourceType = .photoLibrary;
                   imagePicker.allowsEditing = true
                   self.present(imagePicker, animated: true, completion: nil)
               }
               
           }))
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
           self.present(alert, animated: true)
       }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
               let imageData = image.pngData() as NSData?
               
               self.imgView.image = UIImage(data: imageData! as Data)
               self.dismiss(animated: true, completion: nil)
           }
       }
    @IBAction func imageSelectGesture(_ sender: Any) {
        openDialog()
    }

    
    @IBAction func save(_ sender: Any) {
        if titleTxt.text == ""  || descTxt.text == ""{
            
            let alertController = UIAlertController(title: "Alert", message:"All Fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        else {
            if (isExsisting == false) {
                let noteName = titleTxt.text
                let noteDescription = descTxt.text
                let noteCat = txtCat.text
                let date = NSDate()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                let dateString = dateFormatter.string(from: date as Date)
                dtLbl.text = dateString
               
                
                if let manageContext = managedObjectContext {
                    let note = Note(context: manageContext)
                    
                        if imgView != nil {
                           let imageData = imgView.image!.pngData() as NSData?
                            note.noteImage = imageData! as NSData as Data
                           }
                    note.noteName = noteName
                    note.noteDescription = noteDescription
                    note.noteDate = dateString
                    note.noteCategory = noteCat
                    note.noteLat = (locationManager.location?.coordinate.latitude)!
                    note.noteLong = (locationManager.location?.coordinate.longitude)!
                    
                    saveData() {
                                           
                                           let isPresentingInAddFluidPatientMode = self.presentingViewController is UINavigationController
                                           
                                           if isPresentingInAddFluidPatientMode {
                                               self.dismiss(animated: true, completion: nil)
                                               
                                           }
                                           
                                           else {
                                               self.dismiss(animated: true) {
                                                   self.navigationController?.popViewController(animated: true)
                                                   self.dismiss(animated: true, completion: nil)
                                               }
                                               
                                           }

                                       }

                                   }
                               
                               }
            else if (isExsisting == true) {
                
                let note = self.note
                
                let managedObject = note
                managedObject!.setValue(titleTxt.text, forKey: "noteName")
                managedObject!.setValue(descTxt.text, forKey: "noteDescription")
                managedObject!.setValue(dtLbl.text, forKey: "noteDate")
                managedObject!.setValue(txtCat.text, forKey: "noteCategory")
                             
                if let data = self.imgView.image!.jpegData(compressionQuality: 1.0) {
                    managedObject!.setValue(data, forKey: "noteImage")
                }
                
             do {
                             try context.save()
                             
                             let isPresentingInAddFluidPatientMode = self.presentingViewController is UINavigationController
                             
                             if isPresentingInAddFluidPatientMode {
                                 self.dismiss(animated: true, completion: nil)
                                 
                             }
                                 
                             else {
                                 self.navigationController!.popViewController(animated: true)
                                 
                             }
                         }
                         
                         catch {
                             
                         }
                     }

                 }

             }
             

             
    

   func getCategory(of:String) -> Categories?
   {
       var returner:Categories? = nil
       let appdelegate = UIApplication.shared.delegate as! AppDelegate
                     let context = appdelegate.persistentContainer.viewContext
       let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Categories")
       
       do
       {
           let x = try context.fetch(fetchRequest) as! [Categories]
           for category in x
           {
               if let cname = category.categoryName
               {
                   if cname == of
                   {
                       returner = category
                   }
               }
           }
       }
       catch
       {
           
       }
       return returner
   }
  
   func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        note?.noteLat = userLocation.coordinate.latitude
        note?.noteLong = userLocation.coordinate.longitude
    }
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            determineMyCurrentLocation()
            checkLocationAuthorization()
        }
        else{
            
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
    
    
}

