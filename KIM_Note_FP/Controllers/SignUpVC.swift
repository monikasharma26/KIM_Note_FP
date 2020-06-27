//
//  SignUpVC.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-19.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
     let user = UserDefaults.standard
    //Firebase properties added
   

    // MARK: - Properties
       @IBOutlet var upConta_view: UIView!
       @IBOutlet var inConta_view: UIView!
       @IBOutlet var userN_view: UIView!
       @IBOutlet var passwd_view: UIView!
      
       @IBOutlet var signUpbtn: UIButton!
       @IBOutlet var userN_tf: UITextField!
       @IBOutlet var passwd_tf: UITextField!
       
    //Mark: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       setUpUI()
        
        // creating reference to firebase database
        
     
       
       
      
    }
    
   override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          
          //
          self.view.endEditing(true)
      }
    
    func setUpUI() {
           
           userN_view.addBorder(view: userN_view, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
           passwd_view.addBorder(view: passwd_view, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
           signUpbtn.addBorder(view: signUpbtn, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
           upConta_view.addShadow(view: upConta_view, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.8, radius: 5)
           inConta_view.addShadow(view: inConta_view, color: UIColor.lightGray.cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.4, radius: 5)
           signUpbtn.addShadow(view: signUpbtn, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.8, radius: 5)
           
       }
       
    
    @IBAction func btnSignup(_ sender: UIButton) {
        
      // if(userN_tf.text!.count)>=3
              
                  if(userN_tf.text?.isValidEmail())!
                  {
                      if(passwd_tf.text?.isValidPassword())!
                      {
                                  user.set(userN_tf.text, forKey: "username")
                                  user.set(passwd_tf.text, forKey: "password")
                                 let sb = UIStoryboard(name: "Welcome", bundle: nil)
                                  
                                 let welcomeVC = sb.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
                                 self.navigationController?.pushViewController(welcomeVC, animated: true)
                              let signUpValidate = UIAlertController(title: "Congrats!!", message: "Account Created.", preferredStyle: .alert)
                              signUpValidate.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
                              self.present(signUpValidate, animated: true)
                          }
                          else
                          {
                          let signUpValidate = UIAlertController(title: "PASSWORD ALERT", message: "Password should contain one uppercase, one digit, one lowercase and length 8.",preferredStyle: .alert)
                              signUpValidate.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
                              self.present(signUpValidate, animated: true)
                          }
                      }
                      
                  else
                  {
                      let signUpValidate = UIAlertController(title: "USERNAME ALERT", message: "Username needs to be Valid", preferredStyle: .alert)
                                 signUpValidate.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
                                 self.present(signUpValidate, animated: true)
                  }
              }
          
            
        
        // MARK: - Action
        @IBAction func userNHintBtnClicked(_ sender: Any) {
            self.showAlert(title: "Enter Email Address", message: "monika@gmail.com")
        }
        
        @IBAction func passwdHintBtnClicked(_ sender: Any) {
            self.showAlert(title: "Enter Password", message: "monika")
        }
        
}
