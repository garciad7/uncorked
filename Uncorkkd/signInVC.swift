//
//  signInVCViewController.swift
//  Uncorkd
//
//  Created by David on 1/5/17.
//  Copyright © 2017 DG. All rights reserved.
//

import UIKit
import Parse

class signInVC: UIViewController {
    
    // textfield
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    // buttons
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var forgotBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tap to hide keyboard
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboardTap(_:)))
        hideTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
    }
    
    
    // hide keyboard if tapped
    func hideKeyboardTap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    // clicked sign in button
    @IBAction func signInBtn_click(_ sender: Any) {
        print("sign in pressed")
        
        // hide keyboard
        self.view.endEditing(true)
        
        if (usernameTxt.text!.isEmpty || passwordTxt.text!.isEmpty) {
            let alert = UIAlertController(title: "Ooops", message: "You forgot to fill in a field.", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        
        // login functions
        PFUser.logInWithUsername(inBackground: usernameTxt.text!, password: passwordTxt.text!) { (user, error) -> Void in
            
            if error == nil {
                
                // remember user or save in App Memory did the user login or not
                UserDefaults.standard.set(user?.username, forKey: "username")
                UserDefaults.standard.synchronize()
                
                // call login fucntion from AppDelegate.swift class
                let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.login()
            } else {
                
                //show alert message
                let alert = UIAlertController(title: "uh oh", message: error!.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
}
