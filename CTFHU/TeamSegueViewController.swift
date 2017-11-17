//
//  TeamSegueViewController.swift
//  CTFHU
//
//  Created by Logan Cain on 11/17/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//

import UIKit

class TeamSegueViewController: UIViewController {

    var team: TeamObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = team?.teamName

        
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
