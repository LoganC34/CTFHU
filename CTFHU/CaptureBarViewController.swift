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

protocol DataSentDelegate {
    func userCapturedFlag(flagImage: String)
}

class CaptureBarViewController: UIViewController {
    
    @IBOutlet weak var magProgress: MKMagneticProgress!
    
    var delegate: DataSentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        magProgress.setProgress(progress: CGFloat(0.0))
        magProgress.progressShapeColor = UIColor.cyan
        magProgress.backgroundShapeColor = UIColor.black
        magProgress.titleColor = UIColor.cyan
        magProgress.percentColor = UIColor.cyan
        
        magProgress.lineWidth = 10
        magProgress.orientation = .bottom
        magProgress.lineCap = .round
        
        magProgress.title = "Flag A"
        magProgress.percentLabelFormat = "%.2f%%"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func captureFlag(_ sender: UIButton) {
        var i = 0.0
        while i <= 1.0 {
            magProgress.setProgress(progress: CGFloat(i), animated: true)
            i = i + 0.1
        }
        print("\n")
        print("hello")
        print("\n")
        delegate?.userCapturedFlag(flagImage: "bluePinA")
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

