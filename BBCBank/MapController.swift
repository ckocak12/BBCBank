//
//  MapController.swift
//  BBCBank
//
//  Created by Cansu Koçak on 20/04/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController {
    
    let storyBoardRef = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let locations = Location.getLocations()

    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocationAccess()
        addAnnotations()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        let nextPage = self.storyBoardRef.instantiateViewController(withIdentifier: "loginPage") as! LoginController
        self.present(nextPage, animated: true)
    }
    
    
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
            
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func addAnnotations() {
        mapView.delegate = self as MKMapViewDelegate
        mapView.addAnnotations(locations)
    }
}

extension MapController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
            
        else {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
            annotationView.image = UIImage(named:"location_icon")
            return annotationView
        }
        
    }
}
