//
//  Flag.swift
//  CTFHU
//
//  Created by Logan Cain on 11/29/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//

import Foundation

public class Flag {
    var flagName: String?
    var lat: Double?
    var long: Double?
    var altitude: Double?
    var flagImageName: String?
    var flagControlledBy: String?
    var flagRadius: Double?
    var flagValue: Int?
    
    convenience init(flagName: String, lat: Double, long: Double, altitude: Double, flagImageName: String, flagControlledBy: String, flagRadius: Double, flagValue: Int) {
        self.init()
        
        self.flagName = flagName
        self.lat = lat
        self.long = long
        self.altitude = altitude
        self.flagImageName = flagImageName
        self.flagControlledBy = flagControlledBy
        self.flagRadius = flagRadius
        self.flagValue = flagValue
    }
    
    
}
