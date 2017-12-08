//
//  TestFlagViewController.swift
//  CTFHU
//
//  Created by Logan Cain on 11/4/17.
//  Copyright © 2017 Logan Cain. All rights reserved.
//
import UIKit
import ARKit
import SceneKit
import CoreLocation
import MapKit
import MKMagneticProgress

class TestFlagViewController: UIViewController {

    let sceneLocationView = SceneLocationView()
    //var delegate: TestFlagDelegate?

    let mapView = MKMapView()
    var userAnnotation: MKPointAnnotation?
    var locationEstimateAnnotation: MKPointAnnotation?
    let locationManager = CLLocationManager()
    
    var updateUserLocationTimer: Timer?
    
    ///Whether to show a map view
    ///The initial value is respected
    var showMapView: Bool = false
    
    var centerMapOnUserLocation: Bool = true
    
    ///Whether to display some debugging data
    ///This currently displays the coordinate of the best location estimate
    ///The initial value is respected
    var displayDebugging = false
    
    var infoLabel = UILabel()
    
    var updateInfoLabelTimer: Timer?
    
    var adjustNorthByTappingSidesOfScreen = true
    
    
    @IBOutlet weak var flagSeer: ARSCNView!
    @IBOutlet weak var sceneView: ARSCNView!
    
    var data = CaptureBarViewController()
    
    var flagA = FlagDataSet.flagA
    var flagB = FlagDataSet.flagB
    var flagC = FlagDataSet.flagC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        sceneLocationView.run()
        view.addSubview(sceneLocationView)
        // Do any additional setup after loading the view.
        

        
        flagA.flagName = "Flag A"
        //flagA.lat = 35.440208
        //flagA.long = -88.636866
        flagA.lat = 35.440728
        flagA.long = -88.636301
        flagA.altitude = 140
        flagA.flagImageName = "pinA"
        flagA.flagControlledBy = "Red"
        flagA.flagRadius = 5.0
        flagA.flagValue = 100
        
        
        flagB.flagName = "Flag B"
        flagB.lat = 35.438814
        flagB.long = -88.634407
        flagB.altitude = 140
        flagB.flagImageName = "pinB"
        flagB.flagControlledBy = "Red"
        flagB.flagRadius = 5.0
        flagB.flagValue = 100
        
        
        flagC.flagName = "Flag C"
        flagC.lat = 35.439918
        flagC.long = -88.637559
        flagC.altitude = 140
        flagC.flagImageName = "pinC"
        flagC.flagControlledBy = "Red"
        flagC.flagRadius = 5.0
        flagC.flagValue = 100
        
        
        /*
        let coordinate = CLLocationCoordinate2D(latitude: flagA.lat!, longitude: flagA.long!)
        let location = CLLocation(coordinate: coordinate, altitude: flagA.altitude!)
        let image = UIImage(named: flagA.flagImageName!)!
        
        let annotationNode = LocationAnnotationNode(location: location, image: image)
        annotationNode.scaleRelativeToDistance = true
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
        view.addSubview(sceneLocationView)
        
        let coordinateB = CLLocationCoordinate2D(latitude: flagB.lat!, longitude: flagB.long!)
        let locationB = CLLocation(coordinate: coordinateB, altitude: flagB.altitude!)
        let imageB = UIImage(named: flagB.flagImageName!)!
        
        let annotationNodeB = LocationAnnotationNode(location: locationB, image: imageB)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNodeB)
        annotationNodeB.scaleRelativeToDistance = true
        view.addSubview(sceneLocationView)
        
        let coordinateC = CLLocationCoordinate2D(latitude: flagC.lat!, longitude: flagC.long!)
        let locationC = CLLocation(coordinate: coordinateC, altitude: flagC.altitude!)
        let imageC = UIImage(named: flagC.flagImageName!)!
        
        let annotationNodeC = LocationAnnotationNode(location: locationC, image: imageC)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNodeC)
        annotationNodeC.scaleRelativeToDistance = true
        view.addSubview(sceneLocationView)*/
        
        addPinToScreen(latitude: flagA.lat!, longitude: flagA.long!, altitude: flagA.altitude!, ImageName: flagA.flagImageName!)
        addPinToScreen(latitude: flagB.lat!, longitude: flagB.long!, altitude: flagB.altitude!, ImageName: flagB.flagImageName!)
        addPinToScreen(latitude: flagC.lat!, longitude: flagC.long!, altitude: flagC.altitude!, ImageName: flagC.flagImageName!)
        

        
        if displayDebugging {
            sceneLocationView.showFeaturePoints = true
            
        }
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.startUpdatingLocation()
        locationManager.activityType = .fitness
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.pausesLocationUpdatesAutomatically = false
       
        print("\n")
        print(locationManager.location?.horizontalAccuracy)
        print(locationManager.location?.verticalAccuracy)
        print("\n")


    }
    
    
    
    
    func addPinToScreen(latitude: Double, longitude: Double, altitude: Double, ImageName: String) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let location = CLLocation(coordinate: coordinate, altitude: altitude)
        let image = UIImage(named: ImageName)!
        
        let annotationNode = LocationAnnotationNode(location: location, image: image)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
        annotationNode.scaleRelativeToDistance = true
        view.addSubview(sceneLocationView)
        
    }
    
    func removePinFromScreen(latitude: Double, longitude: Double, altitude: Double, imageName: String) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let location = CLLocation(coordinate: coordinate, altitude: altitude)
        let image = UIImage(named: imageName)!
        
        let annotationNode = LocationAnnotationNode(location: location, image: image)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(topBar)
        self.view.addSubview(bottomBar)
        sceneLocationView.frame = view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        sceneLocationView.run()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = false
        sceneLocationView.pause()
    }
    
    
    
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var bottomBar: UIView!

    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    func userCapturedFlag(flagImage: String, flag: String) {
        print("\n")
        print("im before the if statement")
        print("\n")
        
        
        if flagImage == "pinA" && flag == "Flag A" {
            flagA.flagImageName = "bluePinA"
            addPinToScreen(latitude: flagA.lat!, longitude: flagA.long!, altitude: flagA.altitude!, ImageName: flagA.flagImageName!)
            //delegate?.giveDataToControlBar(flagName: flag, flagValue: Double(100.0))
            print("\n")
            print("Im blue A")
            print("\n")
        }
        
        else if flagImage == "bluePinA" && flag == "Flag A" {
            flagA.flagImageName = "pinA"
            addPinToScreen(latitude: flagA.lat!, longitude: flagA.long!, altitude: flagA.altitude!, ImageName: flagA.flagImageName!)
            //delegate?.giveDataToControlBar(flagName: flag, flagValue: Double(100.0))
            print("\n")
            print("Im red A")
            print("\n")
        }
        else if flagImage == "pinB" && flag == "Flag B" {
            flagB.flagImageName = "bluePinB"
            addPinToScreen(latitude: flagB.lat!, longitude: flagB.long!, altitude: flagB.altitude!, ImageName: flagB.flagImageName!)
            //delegate?.giveDataToControlBar(flagName: flag, flagValue: Double(100.0))
            print("\n")
            print("Im blue B")
            print("\n")
        }
            
        else if flagImage == "bluePinB" && flag == "Flag B" {
            flagB.flagImageName = "pinB"
            addPinToScreen(latitude: flagB.lat!, longitude: flagB.long!, altitude: flagB.altitude!, ImageName: flagB.flagImageName!)
            //delegate?.giveDataToControlBar(flagName: flag, flagValue: Double(100.0))
            print("\n")
            print("Im red B")
            print("\n")
        }
        else if flagImage == "pinC" && flag == "Flag C" {
            flagC.flagImageName = "bluePinC"
            addPinToScreen(latitude: flagC.lat!, longitude: flagC.long!, altitude: flagC.altitude!, ImageName: flagC.flagImageName!)
            //delegate?.giveDataToControlBar(flagName: flag, flagValue: Double(100.0))
            print("\n")
            print("Im blue C")
            print("\n")
        }
            
        else if flagImage == "bluePinC" && flag == "Flag C" {
            flagC.flagImageName = "pinC"
            addPinToScreen(latitude: flagC.lat!, longitude: flagC.long!, altitude: flagC.altitude!, ImageName: flagC.flagImageName!)
            //delegate?.giveDataToControlBar(flagName: flag, flagValue: Double(100.0))
            print("\n")
            print("Im red C")
            print("\n")
        }
        
    }
    
    

    
    
    }

extension TestFlagViewController: CLLocationManagerDelegate {
    


    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let coordinateForFlagA = CLLocation(latitude: flagA.lat!, longitude: flagA.long!)
        let coordinateForFlagB = CLLocation(latitude: flagB.lat!, longitude: flagB.long!)
        let coordinateForFlagC = CLLocation(latitude: flagC.lat!, longitude: flagC.long!)
        
        let distanceInMetersFromA = coordinateForFlagA.distance(from: locations.last!)
        let distanceInMetersFromB = coordinateForFlagB.distance(from: locations.last!)
        let distanceInMetersFromC = coordinateForFlagC.distance(from: locations.last!)
        
        
        if distanceInMetersFromA <= 30 && flagA.flagImageName == "pinA" {
            while distanceInMetersFromA <= 30 && flagA.flagValue != 0 {
                if flagA.flagValue != 0 {
                    flagA.flagValue = flagA.flagValue! - 10
                    print(flagA.flagValue!)
                    //delegate?.giveDataToControlBar(flagName: flagA.flagName!, flagValue: Double(flagA.flagValue!))

                }
                if flagA.flagValue == 0 {
                    //make progress 100%
                    userCapturedFlag(flagImage: flagA.flagImageName!, flag: flagA.flagName!)
                    showAlert(title: "Flag A", message: "You've captured flag A!")
                    print("\n")
                    print("test A")
                    print("\n")
                }
            }
        }
        else if distanceInMetersFromB <= 30 && flagB.flagImageName == "pinB" {
            while distanceInMetersFromB <= 30 && flagB.flagValue != 0 {
                if flagB.flagValue != 0 {
                    flagB.flagValue = flagB.flagValue! - 10
                    print(flagB.flagValue!)
                    //delegate?.giveDataToControlBar(flagName: flagB.flagName!, flagValue: Double(flagB.flagValue!))
                }
                if flagB.flagValue == 0 {
                    //make progress 100%
                    userCapturedFlag(flagImage: flagB.flagImageName!, flag: flagB.flagName!)
                    showAlert(title: "Flag B", message: "You've captured flag B!")
                    print("\n")
                    print("test B")
                    print("\n")
                }
            }
        }
        else if distanceInMetersFromC <= 30 && flagC.flagImageName == "pinC" {
            while distanceInMetersFromC <= 30 && flagC.flagValue != 0 {
                if flagC.flagValue != 0 {
                    flagC.flagValue = flagC.flagValue! - 10
                    print(flagC.flagValue!)
                    //delegate?.giveDataToControlBar(flagName: flagC.flagName!, flagValue: Double(flagC.flagValue!))
                }
                if flagC.flagValue == 0 {
                    //make progress 100%
                    userCapturedFlag(flagImage: flagC.flagImageName!, flag: flagC.flagName!)
                    showAlert(title: "Flag C", message: "You've captured flag C!")
                    print("\n")
                    print("test C")
                    print("\n")
                }
            }
        }
    }
    
}
