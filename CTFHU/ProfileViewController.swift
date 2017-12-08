//
//  ProfileViewController.swift
//  CTFHU
//
//  Created by Logan Cain on 11/5/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//

import UIKit
import PieCharts


class ProfileViewController: UIViewController {

    @IBOutlet weak var playerAvatar: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerTeamName: UILabel!
    
    @IBOutlet weak var winsLabel: UILabel!
    
    @IBOutlet weak var lossesLabel: UILabel!
    
    @IBOutlet weak var capturesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TeamDataSet.currentPlayer.imageName = "Player"
        TeamDataSet.currentPlayer.playerName = "Cool User 123"
        TeamDataSet.currentPlayer.teamName = "Blue Team"
        TeamDataSet.currentPlayer.wins = 34.0
        TeamDataSet.currentPlayer.losses = 20.0
        TeamDataSet.currentPlayer.captures = 14.0

        playerAvatar.image = UIImage(named: TeamDataSet.currentPlayer.imageName)
        playerName.text = TeamDataSet.currentPlayer.playerName
        playerTeamName.text = TeamDataSet.currentPlayer.teamName
        winsLabel.text = String(TeamDataSet.currentPlayer.wins)
        lossesLabel.text = String(TeamDataSet.currentPlayer.losses)
        capturesLabel.text = String(TeamDataSet.currentPlayer.captures)
        
        playerAvatar.layer.borderWidth = 1
        playerAvatar.layer.masksToBounds = false
        //playerAvatar.layer.borderColor = UIColor.blackColor().CGColor
        playerAvatar.layer.cornerRadius = playerAvatar.frame.height/2
        playerAvatar.clipsToBounds = true
        
        // Do any additional setup after loading the view.


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
