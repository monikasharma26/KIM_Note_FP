//
//  Category.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-26.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
import  CoreData
import UIKit

class Category{
    var categoryName:String!
    var context:NSManagedObjectContext!
    init(withName:String)
    {
        self.categoryName = withName
        let delegate = UIApplication.shared.delegate as! AppDelegate
        self.context = delegate.persistentContainer.viewContext
        
    }
    func save() -> Bool
    {
        let entity = NSEntityDescription.entity(forEntityName: "Categories", in: self.context!)
               let category = NSManagedObject(entity: entity!, insertInto: context!)
        
        category.setValue(self.categoryName, forKey: "categoryName")
        do
        {
            try context.save()
            return true
            
        }
        catch
        {
            return false
        }
    
    }
}
