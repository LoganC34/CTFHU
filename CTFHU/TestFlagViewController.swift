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
    
    let mapView = MKMapView()
    var userAnnotation: MKPointAnnotation?
    var locationEstimateAnnotation: MKPointAnnotation?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sceneLocationView.run()
        view.addSubview(sceneLocationView)
        // Do any additional setup after loading the view.

        let coordinate = CLLocationCoordinate2D(latitude: 35.440208, longitude: -88.636866)
        let location = CLLocation(coordinate: coordinate, altitude: 140)
        let image = UIImage(named: "pinA")!
        
        let annotationNode = LocationAnnotationNode(location: location, image: image)
        annotationNode.scaleRelativeToDistance = true
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
        view.addSubview(sceneLocationView)
        
        let coordinateB = CLLocationCoordinate2D(latitude: 35.439577, longitude: -88.638023)
        let locationB = CLLocation(coordinate: coordinateB, altitude: 140)
        let imageB = UIImage(named: "pinB")!
        
        let annotationNodeB = LocationAnnotationNode(location: locationB, image: imageB)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNodeB)
        annotationNodeB.scaleRelativeToDistance = true
        view.addSubview(sceneLocationView)
        
        let coordinateC = CLLocationCoordinate2D(latitude: 35.439315, longitude: -88.638892)
        let locationC = CLLocation(coordinate: coordinateC, altitude: 140)
        let imageC = UIImage(named: "pinC")!
        
        let annotationNodeC = LocationAnnotationNode(location: locationC, image: imageC)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNodeC)
        annotationNodeC.scaleRelativeToDistance = true
        view.addSubview(sceneLocationView)
        
        
        
        if displayDebugging {
            sceneLocationView.showFeaturePoints = true
        }

        //view.addSubview(sceneLocationView)
        
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(topBar)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

