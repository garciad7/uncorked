//
//  photoVC.swift
//  Uncorkd
//
//  Created by David on 1/16/17.
//  Copyright © 2017 DG. All rights reserved.
//

import UIKit

class photoVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = self.image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationItem.hidesBackButton = false
    }
}
