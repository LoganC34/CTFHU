//
//  Team.swift
//  
//
//  Created by Logan Cain on 11/16/17.
//

import Foundation

public class TeamObject: NSObject{
    var players: [String]?
    var teamName: String?
    var wins: String?
    
    convenience init (players: [String], teamName: String, wins: String) {
        self.init()
        
        self.players = players
        self.teamName = teamName
        self.wins = wins

    }
    
}
