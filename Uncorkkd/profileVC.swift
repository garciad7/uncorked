//
//  profileVC.swift
//  Uncorkd
//
//  Created by David on 1/13/17.
//  Copyright © 2017 DG. All rights reserved.
//

import UIKit

class profileVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    // Backgrounds for buttons
    @IBOutlet weak var checkInsBg: UIView!
    @IBOutlet weak var distinctWinesBg: UIView!
    @IBOutlet weak var totalBadgesBg: UIView!
    
    // Action Buttons
    @IBOutlet weak var checkInsBtn: UIButton!
    @IBOutlet weak var totalBadgesBtn: UIButton!
    @IBOutlet weak var distinctWinesBtn: UIButton!
    @IBOutlet weak var seeAllPhotos: UIButton!
    
    // Table view
    @IBOutlet weak var tableView: UITableView!
    
    // Image collection view
    @IBOutlet weak var collectionView: UICollectionView!
    
    let imageArray = [UIImage(named: "wine1.jpg"), UIImage(named: "wine2.jpg"), UIImage(named: "wine3.jpg"), UIImage(named: "wine4.jpg")]
    
    let dataArray = ["Wine List", "Wish List", "Venues List", "Badges", "Venue Subscribes", "Wine Subscriptions"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Styling for buttons/tableview
        checkInsBg.layer.borderWidth = 0.5
        checkInsBg.layer.borderColor = UIColor.lightGray.cgColor
        
        totalBadgesBg.layer.borderWidth = 0.5
        totalBadgesBg.layer.borderColor = UIColor.lightGray.cgColor
        
        distinctWinesBg.layer.borderWidth = 0.5
        distinctWinesBg.layer.borderColor = UIColor.lightGray.cgColor
        
        collectionView.layer.borderWidth = 0.5
        collectionView.layer.borderColor = UIColor.lightGray.cgColor
        
        tableView.layer.borderWidth = 0.5
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        
        seeAllPhotos.layer.borderWidth = 0.5
        seeAllPhotos.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // *****************************************************************************************
    // MARK: - Collection view data source for images
    // *****************************************************************************************
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.imageView?.image = imageArray[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "showImage", sender: self)
    }

    
    // *****************************************************************************************
    // MARK: - Table view data source
    // *****************************************************************************************
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    
    // *****************************************************************************************
    // MARK: - Segue for image selection
    // *****************************************************************************************
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showImage" {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destination as! photoVC
            
            vc.image = imageArray[indexPath.row]!
        }
        
    }
}
