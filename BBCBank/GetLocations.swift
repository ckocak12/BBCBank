//
//  GetLocations.swift
//  BBCBank
//
//  Created by Cansu Koçak on 21/04/2017.
//  Copyright © 2017 Cansu Koçak. All rights reserved.
//

import MapKit

class Location: NSObject {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    static func getLocations() -> [Location] {
       guard let path = Bundle.main.path(forResource: "ATMLocations", ofType: "plist"), let array = NSArray(contentsOfFile: path) else { return [] }
        
        var locations = [Location]()
        
        for item in array {
            let dictionary = item as? [String:Any]
            let title = dictionary?["title"] as? String
            let subtitle = dictionary?["description"] as? String
            let latitude = dictionary?["latitude"] as? Double ?? 0
            let longitude = dictionary?["longitude"] as? Double ?? 0
            
            let location = Location(title: title, subtitle: subtitle, coordinate: CLLocationCoordinate2DMake(latitude, longitude))
                locations.append(location)
        }
        
        return locations as [Location]
    }
}
    extension Location: MKAnnotation { }
