//
//  SignUp.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-24.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
class SignUp
{
    var id: Int = 0
     var empName: String = ""
    var empEmailId: String = ""
    var empPassword: String = ""
    var cnfPassword: String = ""
        
    init(id: Int, empName: String, empEmailId: String, empPassword: String, cnfPassword: String){
            self.id = id
            self.empName = empName
            self.empEmailId = empEmailId
            self.empPassword = empPassword
            self.cnfPassword = cnfPassword
        }
        
    }

    

