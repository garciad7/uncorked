//
//  nearbyVC.swift
//  Uncorkkd
//
//  Created by David on 1/19/17.
//  Copyright © 2017 DG. All rights reserved.
//

import UIKit

class nearbyVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellSpacingHeight: CGFloat = 8
    
    let imageArray = [UIImage(named: "wine1.jpg"), UIImage(named: "wine2.jpg"), UIImage(named: "wine3.jpg"), UIImage(named: "wine4.jpg")]
    let dataArray = ["Nearby Verified Venues", "Nearby Events", "Nearby Wines", "Nearby Wineries", "Trending Wines", "Top Rated Wines", "Global Feed"]
    let subDataArray = ["Explore nearby verified venues' wine menus",
                        "Find upcoming nearby wine events",
                        "Locate great places to grab a wine",
                        "Find awesome wine near your location",
                        "Find great local wineries around you",
                        "Check out the trending wineries on Uncorkd",
                        "Check out the global activity on Uncorkd"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.layer.borderWidth = 0.5
        //tableView.layer.borderColor = UIColor.lightGray.cgColor
        //tableView.layer.shadowOpacity = 0.5
        //tableView.layer.shadowColor = UIColor.lightGray.cgColor
        //tableView.layer.shadowRadius = 0.5
        //tableView.layer.shadowOffset = CGSize(width: 0, height: -1)
        tableView.backgroundColor = UIColor.clear
    }
    
    
    // *****************************************************************************************
    // MARK: - Table view data source
    // *****************************************************************************************
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.section]
        cell.textLabel?.text = subDataArray[indexPath.section]
        
        // add border and color
        cell.backgroundColor = UIColor.white
        //cell.layer.borderColor = UIColor.lightGray.cgColor
        //cell.layer.borderWidth = 0.5
        //cell.clipsToBounds = false
        
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 0.5
        cell.layer.shadowOffset = CGSize(width: 0, height: -1)
        
        return cell
    }

}
