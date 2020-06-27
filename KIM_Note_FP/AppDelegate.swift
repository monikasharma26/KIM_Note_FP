//
//  AppDelegate.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-12.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

  
    
          
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          if let uncategorized = getCategory(of: "Uncategorized")
          {
              
          }
          else
          {
              let entity = NSEntityDescription.entity(forEntityName: "Categories", in: self.persistentContainer.viewContext)
              let category = NSManagedObject(entity: entity!, insertInto: self.persistentContainer.viewContext)
                             category.setValue("Uncategorized", forKey: "categoryName")
                             do
                             {
                              try persistentContainer.viewContext.save()
                                               
                             }
                             catch
                             {
                                
                             }
                             
          }
          
          return true
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
                 print(x)
                 for category in x
                 {
                     if let cname = category.categoryName
                     {
                         if cname == of {
                             returner = category
                         }
                     }
                 }
                 //context.delete(x.first!)
              // data.remove(at: indexPath.row)
             // self.tableView.deleteRows(at: [indexPath], with: .fade)
             }
             catch
             {
                 
             }
             return returner
         }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack
       func applicationWillTerminate(_ application: UIApplication) {
           self.saveContext()
           
       }
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "KIM_Note_FP")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                  if let error = error as NSError? {
                      fatalError("Unresolved error \(error), \(error.userInfo)")
                  }
              })
              return container
          }()

          
          func saveContext () {
              let context = persistentContainer.viewContext
              if context.hasChanges {
                  do {
                      try context.save()
                  } catch {
                      let nserror = error as NSError
                      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                  }
              }
          }

      }

      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      let context = appDelegate.persistentContainer.viewContext

