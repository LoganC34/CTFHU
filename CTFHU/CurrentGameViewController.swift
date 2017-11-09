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
    
    @IBOutlet weak var teamOneTable: UITableView!
    
    @IBOutlet weak var teamTwoTable: UITableView!
    
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
        
        teamOneTable.layer.shadowColor = UIColor.black.cgColor
        teamOneTable.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        teamOneTable.layer.masksToBounds = false
        teamOneTable.layer.shadowRadius = 1.0
        teamOneTable.layer.shadowOpacity = 0.5
        teamOneTable.layer.cornerRadius = 0.2 * teamOneTable.bounds.size.height
        
        teamTwoTable.layer.shadowColor = UIColor.black.cgColor
        teamTwoTable.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        teamTwoTable.layer.masksToBounds = false
        teamTwoTable.layer.shadowRadius = 1.0
        teamTwoTable.layer.shadowOpacity = 0.5
        teamTwoTable.layer.cornerRadius = 0.2 * teamTwoTable.bounds.size.height
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
 }
    
    @IBAction func unwindToCurrentGame(segue:UIStoryboardSegue) { }
}

