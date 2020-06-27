//
//  HomeViewController.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-24.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var CategoriesView: UIView!
    
    
    @IBOutlet var NotesView: UIView!
    
    @IBOutlet var contactView: UIView!
    @IBOutlet var aboutView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

         let addgesture = UITapGestureRecognizer()
                     addgesture.numberOfTapsRequired = 1
                     addgesture.addTarget(self, action: #selector(category))
               
              let addnotes = UITapGestureRecognizer()
                          addnotes.numberOfTapsRequired = 1
                        addnotes.addTarget(self, action: #selector(notes))
               
               let contactgesture = UITapGestureRecognizer()
                           contactgesture.numberOfTapsRequired = 1
                           contactgesture.addTarget(self, action: #selector(contactbrowser))
               
               let aboutgesture = UITapGestureRecognizer()
                           aboutgesture.numberOfTapsRequired = 1
                           aboutgesture.addTarget(self, action: #selector(aboutbrowser))
       
        CategoriesView.addGestureRecognizer(addgesture)
      NotesView.addGestureRecognizer(addnotes)
        contactView.addGestureRecognizer(contactgesture)
        aboutView.addGestureRecognizer(aboutgesture)
    }
    @objc func category() {
       /*let obj = self.storyboard?.instantiateViewController(withIdentifier: "CustomerListVC") as! CustomerListVC
          obj.option = OptionSelected.Driver
              self.navigationController?.pushViewController(obj, animated: true)*/
         }
      
      @objc func contactbrowser() {
    /*      let obj = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsVC") as! AboutUsVC
                        self.navigationController?.pushViewController(obj, animated: true)*/
         }
      
      @objc func aboutbrowser() {
  /*     let obj = self.storyboard?.instantiateViewController(withIdentifier: "ContacttusVC") as! ContacttusVC
         self.navigationController?.pushViewController(obj, animated: true)*/
         }

      
      @objc func notes() {
       print("selected Note")
       let obj = self.storyboard?.instantiateViewController(withIdentifier: "NoteListVC") as! NoteListVC
        
       // self.present(obj, animated: true, completion: nil)
          self.navigationController?.pushViewController(obj, animated: true)
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

