//
//  CategoryViewController.swift
//  KIM_Note_FP
//
//  Created by Kritima Kukreja on 2020-06-25.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var objects = [Any]()
    var managedContext: NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        // check if all category is present if not add it
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
//        self.view.addGestureRecognizer(tapGesture)
//
         // Core data initialization
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            // create alert
            let alert = UIAlertController(
                title: "Could note get app delegate",
                message: "Could note get app delegate, unexpected error occurred. Try again later.",
                preferredStyle: .alert)
            // add OK action
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default))
            // show alert
            self.present(alert, animated: true)
            return
        }
        managedContext = appDelegate.persistentContainer.viewContext
         
// set context in the storage
        SlickCategoryStorage.storage.setManagedContext(managedObjectContext: managedContext)
        SlickNotesStorage.storage.setManagedContext(managedObjectContext: managedContext)
        let allCategories = SlickCategoryStorage.storage.readCategories(withPredicate: NSPredicate(format: "categoryName = %@", "All"))
               if(allCategories?.count == 0){
                   // app opened first time
                   SlickCategoryStorage.storage.addCategory(categoryToBeAdded: .init(categoryName: "All"))
               }
        // Do any additional setup after loading the view.
    }
   
