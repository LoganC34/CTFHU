//
//  SegueTeamTableViewCell.swift
//  CTFHU
//
//  Created by Logan Cain on 12/9/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//

import UIKit

class SegueTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var teamPlayerName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
