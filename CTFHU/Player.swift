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
    var teamName = Int()
    
    convenience init (playerName: String, teamName: Int) {
        self.init()
        self.playerName = playerName
        self.teamName = teamName
    }

}
