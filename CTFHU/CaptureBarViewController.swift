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
        
        magProgress.setProgress(progress: CGFloat(0.0))
        magProgress.progressShapeColor = UIColor.cyan
        magProgress.backgroundShapeColor = UIColor.black
        magProgress.titleColor = UIColor.cyan
        magProgress.percentColor = UIColor.cyan
        
        magProgress.lineWidth = 10
        magProgress.orientation = .bottom
        magProgress.lineCap = .round
        
        magProgress.title = "Flag A"
        magProgress.percentLabelFormat = "%.1f%%"
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(progressBarForFlagB(notification:)), name: .flagB, object: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func progressBarForFlagB(notification: NSNotification) {
        magProgress.setProgress(progress: 1.0, animated: false)
        magProgress.title = "Flag B"
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

extension Notification.Name {
    static let flagB = Notification.Name("flagB")
}
