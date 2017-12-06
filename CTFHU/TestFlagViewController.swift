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

//protocol TestFlagDelegate {
  //  func capturingFlag(captureValue: Int)
//}



class TestFlagViewController: UIViewController, DataSentDelegate {
    
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
    
    var flagA = Flag()
    var flagB = Flag()
    var flagC = Flag()
    
    var data = CaptureBarViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        sceneLocationView.run()
        view.addSubview(sceneLocationView)
        // Do any additional setup after loading the view.
        
        
        
        flagA.flagName = "Flag A"
        //flagA.lat = 35.440208
        //flagA.long = -88.636866
        flagA.lat = 35.438793
        flagA.long = -88.634345
        flagA.altitude = 140
        flagA.flagImageName = "pinA"
        flagA.flagControlledBy = "Red"
        flagA.flagRadius = 5.0
        flagA.flagValue = 100
        
        
        flagB.flagName = "Flag B"
        flagB.lat = 35.440462
        flagB.long = -88.638821
        flagB.altitude = 140
        flagB.flagImageName = "pinB"
        flagB.flagControlledBy = "Red"
        flagB.flagRadius = 5.0
        flagB.flagValue = 100
        
        
        flagC.flagName = "Flag C"
        flagC.lat = 35.437711
        flagC.long = -88.639761
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
        
        removePinFromScreen(latitude: flagB.lat!, longitude: flagB.long!, altitude: flagB.altitude!, ImageName: flagB.flagImageName!)

        //removePinFromScreen(latitude: flagB.lat!, longitude: flagB.long!, altitude: flagB.altitude!, ImageName: flagB.flagImageName!)
        
        if displayDebugging {
            sceneLocationView.showFeaturePoints = true
            
        }
        
        //view.addSubview(sceneLocationView)
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.startUpdatingLocation()
        locationManager.activityType = .fitness
        locationManager.distanceFilter = 5
        locationManager.pausesLocationUpdatesAutomatically = false
       
        print("\n")
        print(locationManager.location?.horizontalAccuracy)
        print(locationManager.location?.verticalAccuracy)
        print("\n")

        sleep(1)
        
        print("\n")
        print(locationManager.location?.horizontalAccuracy)
        print(locationManager.location?.verticalAccuracy)
        print("\n")
        
        addRegionA()
        addRegionB()
        addRegionC()
        
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
    
    func removePinFromScreen(latitude: Double, longitude: Double, altitude: Double, ImageName: String) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let location = CLLocation(coordinate: coordinate, altitude: altitude)
        let image = UIImage(named: ImageName)!
        
        let annotationNode = LocationAnnotationNode(location: location, image: image)
        //sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
        sceneLocationView.removeLocationNode(locationNode: annotationNode)
        annotationNode.scaleRelativeToDistance = true
        sceneLocationView.removeFromSuperview()
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
        
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
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
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

    
    func addRegionA() {
        let coordinate = CLLocationCoordinate2D(latitude: flagA.lat!, longitude: flagA.long!)
        let region = CLCircularRegion(center: coordinate, radius: flagA.flagRadius!, identifier: "geofence")
        //mapView.removeOverlays(mapView.overlays)
        locationManager.startMonitoring(for: region)
        region.notifyOnEntry = true
        region.notifyOnExit = true
        //let circle = MKCircle(center: coordinate, radius: region.radius)
        //mapView.add(circle)
    }
    
    func addRegionB() {
        let coordinateB = CLLocationCoordinate2D(latitude: flagB.lat!,longitude:  flagB.long!)
        let regionB = CLCircularRegion(center: coordinateB, radius: flagB.flagRadius!, identifier: "geofenceB")
        //mapView.removeOverlays(mapView.overlays)
        locationManager.startMonitoring(for: regionB)
        regionB.notifyOnEntry = true
        regionB.notifyOnExit = true
        //let circleB = MKCircle(center: coordinateB, radius: regionB.radius)
        //mapView.add(circleB)
    }
    
    func addRegionC() {
        let coordinateC = CLLocationCoordinate2D(latitude: flagC.lat!,longitude:  flagC.long!)
        let regionC = CLCircularRegion(center: coordinateC, radius: flagC.flagRadius!, identifier: "geofenceC")
        //mapView.removeOverlays(mapView.overlays)
        locationManager.startMonitoring(for: regionC)
        regionC.notifyOnEntry = true
        regionC.notifyOnExit = true
        //let circleC = MKCircle(center: coordinateC, radius: regionC.radius)
        //mapView.add(circleC)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func userCapturedFlag(flagImage: String) {
        print("\n")
        print("im before the if statement")
        print("\n")
        if flagImage == "bluePinA" {
            flagA.flagImageName = "bluePinA"
            addPinToScreen(latitude: flagA.lat!, longitude: flagA.long!, altitude: flagA.altitude!, ImageName: flagA.flagImageName!)
            print("\n")
            print("im in the if statement")
            print("\n")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "captureBar" {
            let captureBarVC: CaptureBarViewController = segue.destination as! CaptureBarViewController
            captureBarVC.delegate = self
        }
    }
    

    }

extension TestFlagViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        /*
        if locations.last!.horizontalAccuracy < 30 {
            print (locations.last!.horizontalAccuracy)
        }
        else {

            locationManager.startUpdatingLocation()
            print (locations.last!.horizontalAccuracy)
        }
        */
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion, locations:[CLLocation]) {
        if region.identifier == "geofence" {
            let title = "You Entered the Flag A Region"
            let message = "Capturing Flag A"
            showAlert(title: title, message: message)
            //delegate?.capturingFlag(captureValue: flagA.flagValue!)
            
        }
        else if region.identifier == "geofenceB" {
            let title = "You Entered the Flag B region!"
            let message = "Capturing Flag B"
            showAlert(title: title, message: message)
            //delegate?.capturingFlag(captureValue: flagB.flagValue!)
        }
        
        else if region.identifier == "geofenceC" {
            let title = "You Entered the Flag C region!"
            let message = "Capturing Flag C"
            showAlert(title: title, message: message)
            //delegate?.capturingFlag(captureValue: flagC.flagValue!)
        }
        
        print("\n")
        print("**************************** ENTERED **********************")
        print("\n")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region.identifier == "geofence" {
            let title = "You left the Flag A Region"
            let message = "leaving Flag A"
            showAlert(title: title, message: message)
            
        }
        if region.identifier == "geofenceB" {
            let title = "You left the Flag B region!"
            let message = "leaving Flag B"
            showAlert(title: title, message: message)
        }
            
        if region.identifier == "geofenceC" {
            let title = "You left the Flag C region!"
            let message = "leaving Flag C"
            showAlert(title: title, message: message)
        }
        print("\n")
        print("**************************** EXITED **********************")
        print("\n")
    }
}

