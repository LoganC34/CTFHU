//
//  SegueTeamPlayersTableViewController.swift
//  CTFHU
//
//  Created by Logan Cain on 11/17/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//

import UIKit

class SegueTeamPlayersTableViewController: UITableViewController {

    var data = TeamDataSet.blueTeamPlayerNames
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        TeamDataSet.playerRed1.playerName = "Red Team Player 1"
  
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamPlayerCell", for: indexPath)
        
        // Configure the cell...
        
        if let leaderboardCell = cell as? SegueTeamTableViewCell {
                let team:Team
                leaderboardCell.teamPlayerName.text? = data[indexPath.row]
  
        }
        
        return cell
    }
}
