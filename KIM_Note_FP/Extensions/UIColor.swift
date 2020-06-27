//
//  UIColor.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-20.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    class func hexStringToUIColor (hex:String) -> UIColor {
           var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
           
           if (cString.hasPrefix("#")) {
               cString.remove(at: cString.startIndex)
           }
           
           if ((cString.count) != 6) {
               return UIColor.gray
           }
           
           var rgbValue:UInt32 = 0
           return UIColor(
               red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
               green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
               blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
               alpha: CGFloat(1.0)
           )
       }
       
       class func pinkThemeColor() -> UIColor
       {
           return UIColor(red: 111/255, green: 202/255, blue: 238/255, alpha: 1)
           
       }
       
       class func rbg(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
           let color = UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
           return color
       }
}
