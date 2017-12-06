//
//  ProfileViewController.swift
//  CTFHU
//
//  Created by Logan Cain on 11/5/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var playerAvatar: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerTeamName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TeamDataSet.currentPlayer.imageName = "Player"
        TeamDataSet.currentPlayer.playerName = "Cool User 123"
        TeamDataSet.currentPlayer.teamName = "Blue Team"
        //callFunc()
        
        playerAvatar.image = UIImage(named: TeamDataSet.currentPlayer.imageName)
        playerName.text = TeamDataSet.currentPlayer.playerName
        playerTeamName.text = TeamDataSet.currentPlayer.teamName
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callFunc() {
        TeamDataSet.currentPlayer.teamName = "Green Team"
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
