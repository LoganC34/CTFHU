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



class TestFlagViewController: UIViewController, CLLocationManagerDelegate {

    let sceneLocationView = SceneLocationView()
    
    let mapView = MKMapView()
    var userAnnotation: MKPointAnnotation?
    var locationEstimateAnnotation: MKPointAnnotation?
    var locationManager : CLLocationManager = CLLocationManager()
    
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
    
    var adjustNorthByTappingSidesOfScreen = false
    

    @IBOutlet weak var flagSeer: ARSCNView!
    @IBOutlet weak var sceneView: ARSCNView!
    
    var flagA = Flag()
    var flagB = Flag()
    var flagC = Flag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sceneLocationView.run()
        view.addSubview(sceneLocationView)
        // Do any additional setup after loading the view.

        
        
        flagA.flagName = "Flag A"
        //flagA.lat = 35.440208
        //flagA.long = -88.636866
        flagA.lat = 35.438837
        flagA.long = -88.634638
        flagA.altitude = 140
        flagA.flagImageName = "pinA"
        flagA.flagControlledBy = "Red"
        flagA.flagRadius = 5.0
        flagA.flagValue = 100
        
        
        flagB.flagName = "Flag B"
        flagB.lat = 35.439577
        flagB.long = -88.638023
        flagB.altitude = 140
        flagB.flagImageName = "pinB"
        flagB.flagControlledBy = "Red"
        flagB.flagRadius = 5.0
        flagB.flagValue = 100
        
        
        flagC.flagName = "Flag C"
        flagC.lat = 35.439315
        flagC.long = -88.638892
        flagC.altitude = 140
        flagC.flagImageName = "pinC"
        flagC.flagControlledBy = "Red"
        flagC.flagRadius = 5.0
        flagC.flagValue = 100
        
        
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
        view.addSubview(sceneLocationView)

        if displayDebugging {
            sceneLocationView.showFeaturePoints = true
            
        }

        //view.addSubview(sceneLocationView)
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.setUpGeofenceForFlagA()
            self.setUpGeofenceForFlagB()
            self.setUpGeofenceForFlagC()
        }
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
    func setUpGeofenceForFlagA() {
        let geofenceRegionCenter = CLLocationCoordinate2DMake( flagA.lat!, flagA.long!);
        let geofenceRegion = CLCircularRegion(center: geofenceRegionCenter, radius: flagA.flagRadius!, identifier: flagA.flagName!);
        geofenceRegion.notifyOnExit = true;
        geofenceRegion.notifyOnEntry = true;
        self.locationManager.startMonitoring(for: geofenceRegion)
    }
    func setUpGeofenceForFlagB() {
        let geofenceRegionCenter = CLLocationCoordinate2DMake(flagB.lat!, flagB.long!);
        let geofenceRegion = CLCircularRegion(center: geofenceRegionCenter, radius: flagB.flagRadius!, identifier: flagB.flagName!);
        geofenceRegion.notifyOnExit = true;
        geofenceRegion.notifyOnEntry = true;
        self.locationManager.startMonitoring(for: geofenceRegion)
    }
    func setUpGeofenceForFlagC() {
        let geofenceRegionCenter = CLLocationCoordinate2DMake(flagC.lat!, flagC.long!);
        let geofenceRegion = CLCircularRegion(center: geofenceRegionCenter, radius: flagC.flagRadius!, identifier: flagC.flagName!);
        geofenceRegion.notifyOnExit = true;
        geofenceRegion.notifyOnEntry = true;
        self.locationManager.startMonitoring(for: geofenceRegion)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Welcome to Playa Grande! If the waves are good, you can try surfing!")
        //Good place to schedule a local notification
    }
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Bye! Hope you had a great day at the beach!")
        //Good place to schedule a local notification
    }
}

