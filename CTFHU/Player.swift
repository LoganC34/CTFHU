//
//  Player.swift
//  CTFHU
//
//  Created by Logan Cain on 11/16/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//

import Foundation

public class Player {
    var playerName = String()
    var teamName = String()
    var imageName = String()
    weak var team:Team?
    var wins = Double()
    var losses = Double()
    var captures = Double()
    
    
    convenience init (playerName: String, imageName: String, wins: Double, losses: Double, captures: Double) {
        self.init()
        self.playerName = playerName
        //self.teamName = teamName
        self.imageName = imageName
        self.wins = wins
        self.losses = losses
        self.captures = captures
        
        
    }

}

