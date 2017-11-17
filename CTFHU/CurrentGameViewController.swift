//
//  FirstViewController.swift
//  CTFHU
//
//  Created by Logan Cain on 11/4/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//

import UIKit

class CurrentGameViewController: UIViewController {

    @IBOutlet weak var arButton: UIButton!



    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arButton.layer.shadowColor = UIColor.black.cgColor
        arButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        arButton.layer.masksToBounds = false
        arButton.layer.shadowRadius = 1.0
        arButton.layer.shadowOpacity = 0.5
        arButton.layer.cornerRadius = 0.5 * arButton.bounds.size.width
        
        /*teamTable.layer.shadowColor = UIColor.black.cgColor
        teamTable.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        teamTable.layer.masksToBounds = false
        teamTable.layer.shadowRadius = 1.0
        teamTable.layer.shadowOpacity = 0.5
        teamTable.layer.cornerRadius = 0.2 * teamTable.bounds.size.height*/
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
 }
    
    @IBAction func unwindToCurrentGame(segue:UIStoryboardSegue) { }
    
    
    let textCellIdentifierOne = "TeamOne"
    let textCellIdentifierTwo = "TeamTwo"
    let swiftBlogs = ["Ray Wenderlich", "NSHipster", "iOS Developer Tips", "Jameson Quave", "Natasha The Robot", "Coding Explorer", "That Thing In Swift", "Andrew Bancroft", "iAchieved.it", "Airspeed Velocity"]
    
}



