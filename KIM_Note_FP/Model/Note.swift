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
       
       
