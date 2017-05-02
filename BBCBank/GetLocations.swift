//
//  GetLocations.swift
//  BBCBank
//
//  Created by Cansu Koçak on 21/04/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import MapKit

class Location: NSObject {
    
    static func getLocations() -> [MKPointAnnotation] {
       guard let path = Bundle.main.path(forResource: "ATMLocations", ofType: "plist"), let array = NSArray(contentsOfFile: path) else { return [] }
        
        var annotations = [MKPointAnnotation]()
        
        for item in array {
            let dictionary = item as? [String:Any]
            let title = dictionary?["title"] as? String
            let subtitle = dictionary?["description"] as? String
            let latitude = dictionary?["latitude"] as? Double ?? 0
            let longitude = dictionary?["longitude"] as? Double ?? 0
            
            let annotation = MKPointAnnotation()
            
            
            annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            annotation.title = title
            annotation.subtitle = subtitle
            annotations.append(annotation)
        }
        
        return annotations as [MKPointAnnotation]
    }
}
