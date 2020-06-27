//
//  UIViewController.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-19.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //Mark:
    ///
       func showAlert(title: String, message: String) {
           DispatchQueue.main.async {
               let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
               self.present(alert, animated: true, completion: nil)
           }
       }
    func navigateScreen(storyboard: String, controller: String) {
        
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: controller)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func navigateTabScreen(storyboard: String, controller: String) {
        
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: controller)
        self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.show(vc, sender: self)
        //self.navigationController?.pushViewController(vc, animated: true)
    }

}
