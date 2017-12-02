//
//  CaptureBarViewController.swift
//  CTFHU
//
//  Created by Logan Cain on 11/14/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//

import UIKit
import CoreGraphics
import MKMagneticProgress


class CaptureBarViewController: UIViewController {

    @IBOutlet weak var magProgress: MKMagneticProgress!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
         magProgress.setProgress(progress: CGFloat(0.4))
         magProgress.progressShapeColor = UIColor.blue
         magProgress.backgroundShapeColor = UIColor.black
         magProgress.titleColor = UIColor.blue
         magProgress.percentColor = UIColor.black
         
         magProgress.lineWidth = 10
         magProgress.orientation = .bottom
         magProgress.lineCap = .round
         
         magProgress.title = "Title"
         magProgress.percentLabelFormat = "%.2f%%"
        
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
