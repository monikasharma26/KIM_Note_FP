//
//  ContacttusVC.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-27.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import MessageUI
class ContacttusVC: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnContact(_ sender: Any) {
            let alert = UIAlertController(title: "Contact Us",
                                          message: "email us at \n monika@gmail.com \n Helpine Number +1999-999-9999",
                preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Cancel",
                                         style: .cancel, handler: nil)
            alert.addAction(okAction)
            let callAction = UIAlertAction(title: "HelpLine Number",
                                               style: .default, handler: {
                                                _ in
                                                self.makeCall()
                })
                alert.addAction(callAction)
                let smsAction = UIAlertAction(title: "Send SMS",
                                              style: .default, handler: {
                                                _ in
                                                self.sendSMS()
                })
                alert.addAction(smsAction)
                self.present(alert, animated: true, completion: nil)
            }
                    
                    private func makeCall()
                    {
                        if let url = URL(string: "tel://+1999-999-9999)"), UIApplication.shared.canOpenURL(url){
                            if #available(iOS 10, *)
                            {
                                UIApplication.shared.open(url)
                            }
                            else
                            {
                                UIApplication.shared.openURL(url)
                            }
                        }
                    }
        
        private func sendSMS()
        {
            if MFMessageComposeViewController.canSendText()
            {
                let smsVC = MFMessageComposeViewController()
                smsVC.body = "Hello, How can I help You?"
                smsVC.recipients = ["+1999-999-9999"]
                smsVC.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate
                self.present(smsVC, animated: false, completion: nil)
            }
            else
            {
                print("NO SIM available")
            }
        }
}

