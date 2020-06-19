//
//  Note.swift
//  KIM_Note_FP
//
//  Created by Kritima Kukreja on 2020-06-19.
//  Copyright © 2020 S@i. All rights reserved.

import UIKit

class Note: NSObject, NSCoding {
    
    // MARK: Variables

    var title: String?
    var content: UITextView?
    var uuid: String
    var editDate: NSDate?
    
    // MARK: Constructors
    
    init(title: String, content: String) {
           self.title = title
           self.content = UITextView()
           self.content?.text = content
           self.uuid = NSUUID().uuidString
           self.editDate = NSDate()
       }
       
       // MARK: Data Management Protocols
           
           func encodeWithCoder(coder: NSCoder) {
            coder.encode(content, forKey: "Content")
            coder.encode(title, forKey: "Title")
            coder.encode(uuid, forKey: "UUID")
            coder.encode(editDate, forKey: "EditDate")
           }
           
           required init?(coder: NSCoder) {
            content = coder.decodeObject(forKey: "Content") as? UITextView
            title = coder.decodeObject(forKey: "Title") as? String
            uuid = coder.decodeObject(forKey: "UUID") as! String
            editDate = coder.decodeObject(forKey: "EditDate") as? NSDate
               }
               
              

           }



