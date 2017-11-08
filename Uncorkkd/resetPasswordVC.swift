//
//  resetPasswordVC.swift
//  Uncorkd
//
//  Created by David on 1/5/17.
//  Copyright © 2017 DG. All rights reserved.
//

import UIKit
import Parse

class resetPasswordVC: UIViewController {
    
    // textfield
    @IBOutlet weak var emailTxt: UITextField!
    
    // buttons
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // clicked reset button
    @IBAction func resetBtn_click(_ sender: Any) {
        
        // hide keyboard
        self.view.endEditing(true)
        
        // email textfield is empty
        if emailTxt.text!.isEmpty {
            
            //show alert message
            let alert = UIAlertController(title: "Oops", message: "Email field is empty. Please enter a valid email.", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        
        
        // requestPassword no longer working with discontinuation of Parse.com
        // must use mailgun account to work, see http://stackoverflow.com/questions/37689774/cannot-send-email-from-parse-server-on-heroku
        
        // request for reseting password
        PFUser.requestPasswordResetForEmail(inBackground: emailTxt.text!) { (success, error) -> Void in
            
            if success {
                
                // show alert message
                let alert = UIAlertController(title: "Email for resetting password", message: "has been sent to texted email", preferredStyle: UIAlertControllerStyle.alert)
                
                // if pressed OK call self.dismiss.. function
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
                    self.dismiss(animated: true, completion: nil)
                })
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    // clicked cancel button
    @IBAction func cancelBtn_click(_ sender: Any) {
        
        //hide keyboard
        self.view.endEditing(true)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
