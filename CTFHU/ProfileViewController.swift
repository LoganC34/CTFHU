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
    
    @IBOutlet weak var chartView: PieChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TeamDataSet.currentPlayer.imageName = "Player"
        TeamDataSet.currentPlayer.playerName = "Cool User 123"
        TeamDataSet.currentPlayer.teamName = "Blue Team"
        TeamDataSet.currentPlayer.wins = 34.0
        TeamDataSet.currentPlayer.losses = 20.0
        TeamDataSet.currentPlayer.captures = 14.0
        //callFunc()
        
        playerAvatar.image = UIImage(named: TeamDataSet.currentPlayer.imageName)
        playerName.text = TeamDataSet.currentPlayer.playerName
        playerTeamName.text = TeamDataSet.currentPlayer.teamName
        
        // Do any additional setup after loading the view.

        chartView.models = [
            PieSliceModel(value: TeamDataSet.currentPlayer.wins, color: UIColor.green),
            PieSliceModel(value: TeamDataSet.currentPlayer.captures, color: UIColor.blue),
            PieSliceModel(value: TeamDataSet.currentPlayer.losses, color: UIColor.red)
            
        ]
        
        chartView.layers = [PiePlainTextLayer(), PieLineTextLayer()]
        
        let textLayerSettings = PiePlainTextLayerSettings()
        textLayerSettings.viewRadius = 55
        textLayerSettings.hideOnOverflow = true
        textLayerSettings.label.font = UIFont.systemFont(ofSize: 8)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        textLayerSettings.label.textGenerator = {slice in
            return formatter.string(from: slice.data.id * 100 as NSNumber).map{"\($0)%"} ?? ""
        }
        
        let textLayer = PiePlainTextLayer()
        textLayer.settings = textLayerSettings
        
        
        let viewLayer = PieCustomViewsLayer()
        
        let settings = PieCustomViewsLayerSettings()
        settings.viewRadius = 135
        settings.hideOnOverflow = false
        viewLayer.settings = settings
        
        viewLayer.viewGenerator = {slice, center in
            let myView = UIView()
            // add images, animations, etc.
            return myView
        }
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
