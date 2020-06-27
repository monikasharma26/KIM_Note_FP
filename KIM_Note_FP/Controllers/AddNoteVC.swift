//
//  AddNoteVC.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-26.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class AddNoteVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var txttitle: UITextField!
    @IBOutlet var txtdesc: UITextView!
    @IBOutlet var txtCategory: UITextField!
    @IBOutlet var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnSave(_ sender: Any) {
    }
    
    @IBAction func addCategory(_ sender: Any) {
    }
    @IBAction func location(_ sender: Any) {
    }
    @IBAction func audio(_ sender: Any) {
    }
    @IBAction func backBtn(_ sender: Any) {
    }
   
    @IBAction func addImage(_ sender: UIImageView){
        openDialogImage()
    }
    func openDialogImage(){
        let alert = UIAlertController(title: "Note", message: "Pick image from", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                var imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { action in
            
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                var imagePicker = UIImagePickerController()
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
              
              self.image.image = UIImage(data: imageData! as Data)
              self.dismiss(animated: true, completion: nil)
          }
      }
       
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           picker.dismiss(animated: true, completion: nil)
           
       }
    
}
