//  IKEADetailViewController.swift
//  IKEAFinder
//  Created by Elliott, Rob on 9/24/18.
//  Copyright © 2018 Elliott, Rob. All rights reserved.
//

import UIKit

class IKEADetailViewController : UIViewController {
    
    var selectedIKEA: IKEA!
    
    @IBOutlet weak var lblStoreName: UILabel!
    
    @IBOutlet weak var storeImage: UIImageView!
    
//    @IBOutlet weak var lblStoreNum: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        print(selectedIKEA.storeName)
        
        lblStoreName.text = selectedIKEA.storeName
        
        self.storeImage.image = #imageLiteral(resourceName: "IKEAStore")
        
    
        
        
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let mapView = segue.destination as! IKEAMapViewController
        
        mapView.selectedIKEA = selectedIKEA
    
        
    }
    
   
    
}
