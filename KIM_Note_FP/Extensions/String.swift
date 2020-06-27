//
//  String.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-20.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
import UIKit

extension String{
    
    //Validate Email
    func isValidEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    //Validate Password
    func isValidPassword() -> Bool{
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@",
                                       passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
   
}
