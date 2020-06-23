//
//  EditNotesViewController.swift
//  KIM_Note_FP
//
//  Created by VirkIkroop on 2020-06-23.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class EditNotesViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var selectImage: UIButton!
    
    
    
    @IBOutlet weak var notesImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnImage(_ sender: UIButton)
    {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        
        let alertController = UIAlertController(title: "Add an Image", message: "Choose From", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            pickerController.sourceType = .camera
            self.present(pickerController, animated: true, completion: nil)
            }
        
        let photosLibraryAction = UIAlertAction(title: "Photos Library", style: .default) { (action) in
            pickerController.sourceType = .photoLibrary
            self.present(pickerController, animated: true, completion: nil)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertController.addAction(cameraAction)
        alertController.addAction(photosLibraryAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            let imageData = image.pngData() as NSData?

       self.notesImageView.image = UIImage(data: imageData! as Data)
               self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
