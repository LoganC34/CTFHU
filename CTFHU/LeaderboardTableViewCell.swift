//
//  LeaderboardTableViewCell.swift
//  CTFHU
//
//  Created by Logan Cain on 11/17/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTeamNameLabel: UILabel!
    
    @IBOutlet weak var lbWinsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
