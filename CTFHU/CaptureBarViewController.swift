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
    var timer: Timer!
    
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
        NotificationCenter.default.addObserver(self, selector: #selector(progressBarForFlagA(notification:)), name: .flagA, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(progressBarForFlagC(notification:)), name: .flagC, object: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func progressBarForFlagB(notification: NSNotification) {
        timerfunctionB()    }

    func timerfunctionB() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(counterSecondsB), userInfo: nil, repeats: true)
        
    }
    var counter = 0
    var progressPercentage = 0.1
    @objc func counterSecondsB() {
        print("Capping...")
        magProgress.setProgress(progress: CGFloat(progressPercentage), animated: false)
        progressPercentage = progressPercentage + 0.1
        counter = counter + 1
        magProgress.title = "Flag B"
        if counter == 10 {
            timer.invalidate()
            NotificationCenter.default.post(name: .flagBCaptured, object: nil)
            
            counter = 0
            progressPercentage = 0
        }
    }
    
    @objc func progressBarForFlagA(notification: NSNotification) {
        timerfunctionA()    }
    
    func timerfunctionA() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(counterSecondsA), userInfo: nil, repeats: true)
        
    }

    @objc func counterSecondsA() {
        print("Capping...")
        magProgress.setProgress(progress: CGFloat(progressPercentage), animated: false)
        progressPercentage = progressPercentage + 0.1
        counter = counter + 1
        magProgress.title = "Flag A"
        if counter == 10 {
            timer.invalidate()
            NotificationCenter.default.post(name: .flagACaptured, object: nil)
            
            counter = 0
            progressPercentage = 0
        }
    }
    
    @objc func progressBarForFlagC(notification: NSNotification) {
        timerfunctionC()    }
    
    func timerfunctionC() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(counterSecondsC), userInfo: nil, repeats: true)
        
    }
    
    @objc func counterSecondsC() {
        print("Capping...")
        magProgress.setProgress(progress: CGFloat(progressPercentage), animated: false)
        progressPercentage = progressPercentage + 0.1
        counter = counter + 1
        magProgress.title = "Flag C"
        if counter == 10 {
            timer.invalidate()
            NotificationCenter.default.post(name: .flagCCaptured, object: nil)
            
            counter = 0
            progressPercentage = 0
        }
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
    static let flagA = Notification.Name("flagA")
    static let flagC = Notification.Name("flagC")
}
