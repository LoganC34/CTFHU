//
//  teamDataSet.swift
//  CTFHU
//
//  Created by Logan Cain on 11/16/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//

import Foundation

class TeamDataSet {
    
    static var playerRed1 = Player()
    static var playerRed2 = Player()
    static var playerRed3 = Player()
    static var playerRed4 = Player()
    
    static var playerBlue1 = Player()
    static var playerBlue2 = Player()
    static var playerBlue3 = Player()
    static var playerBlue4 = Player()
    
    static var currentPlayer = playerRed1
    
    static var redTeam = Team(players: [playerRed1, playerRed2], teamName: "Red", wins: "43")
    
    
    static var teamSampleData = [
        Team(players: [playerRed1], teamName: "Red Team", wins: "5"),
        /*Team(players: ["Player 1","Player 2","Player 3","Player 4"], teamName: "Green Team", wins: "3"),
        Team(players: ["Player 1","Player 2","Player 3","Player 4"], teamName: "Blue Team", wins: "2"),
        Team(players: ["Player 1","Player 2","Player 3","Player 4"], teamName: "Blue Team", wins: "2"),
        Team(players: ["Player 1","Player 2","Player 3","Player 4"], teamName: "Yellow Team", wins: "2"),
        Team(players: ["Player 1","Player 2","Player 3","Player 4"], teamName: "Cyan Team", wins: "2"),
        Team(players: ["Player 1","Player 2","Player 3","Player 4"], teamName: "Gold Team", wins: "2"),
        Team(players: ["Player 1","Player 2","Player 3","Player 4"], teamName: "Orange Team", wins: "2"),
        Team(players: ["Player 1","Player 2","Player 3","Player 4"], teamName: "Purple Team", wins: "2")*/
    ]
    
    static public func setupTeams() {
        
        redTeam.addPlayer(player: playerRed1)
    }
    
    
}
