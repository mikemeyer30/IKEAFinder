//
//  IKEATableViewController.swift
//  IKEAFinder
//
//  Created by Elliott, Rob on 9/24/18.
//  Copyright © 2018 Elliott, Rob. All rights reserved.
//

import UIKit

class IKEATableViewController : UITableViewController {
    
    var IKEABucket: IKEADataStore!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return IKEABucket.allIKEAs.count
        
        
    }
    
    
    // Function to format view size
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // GET HEIGHT OF THE STATUS BAR
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // FIND A REUSABLE CELL FROM THE STORYBOARD
        let thisCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // BIND A SPECIFIC INSTANCE OF THE IKEA CLASS (Stored in the bucket) TO THE TABLE CELL WE FOUND
        let thisIKEA = IKEABucket.allIKEAs[indexPath.row]
        
        
        // DISPLAY INFORMATION TO THE USER ON THE TABLE CELL
        thisCell.textLabel?.text = thisIKEA.storeName
        thisCell.detailTextLabel?.text = thisIKEA.country
        
        
        
        // RETURN THE FORMATTED CELL
        return thisCell
        
        
        
    }
    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // GET REFERENCE TO SEGUE TARGET
        let detailView = segue.destination as! IKEADetailViewController
        
        
        // FIGURE OUT WHICH CELL WAS CLICKED
        if let indexPath = self.tableView.indexPathForSelectedRow {
            
            // FInd the specific IKEA object corresponding to that cell
            let selectedIKEA = IKEABucket.allIKEAs[indexPath.row]
            
            // MOVE A COPY OF THE INSTANCE OF THE SELECTED IKEA CLASS
            // FROM THIS VIEW CONTROLLER TO THE NEXT VIEW CONTROLLER
            
            detailView.selectedIKEA = selectedIKEA
            
            
            
        }
        
    }
    
}
