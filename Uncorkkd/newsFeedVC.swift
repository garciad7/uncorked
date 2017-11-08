//
//  newsFeedVC.swift
//  Uncorkd
//
//  Created by David on 1/17/17.
//  Copyright © 2017 DG. All rights reserved.
//

import UIKit

class newsFeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func search(_ sender: Any) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "searchVC") as! searchVC
        self.present(next, animated: true, completion: nil)
    }

}
