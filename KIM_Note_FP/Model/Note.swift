//
//  Notes.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-26.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class NoteData
{
    private var context:NSManagedObjectContext!
    private var title:String!
    private var desc:String!
     private var cat:String!
    private var lat:String!
    private var long:String!
    private var date = Date()
    
    init(withTitle title:String, desc:String,cat:String ,lat:String,long:String)
    {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appdelegate.persistentContainer.viewContext
        self.title = title
        self.desc = desc
         self.cat = cat
        self.lat = lat
        self.long = long
        
    }
    func save() -> Bool
    {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
      
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: self.context!)
        let note = NSManagedObject(entity: entity!, insertInto: context)
        
        note.setValue(self.title, forKey: "noteName")
        note.setValue(self.lat, forKey: "location")
        note.setValue(self.desc, forKey: "noteDescription")
        note.setValue(self.cat, forKey: "noteCategory")
       // note.setValue(self.cat, forKey: "noteImage")
        note.setValue(self.date, forKey: "date")
        
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

