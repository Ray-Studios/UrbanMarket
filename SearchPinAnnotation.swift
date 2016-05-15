//
//  SearchPinAnnotation.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 7/13/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

import UIKit
import MapKit

class SearchPinAnnotation: NSObject,MKAnnotation{

    let coordinate: CLLocationCoordinate2D
    var title: String
    var subtitle: String
    var ranking: Int
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, ranking: Int) {
        self.coordinate = coordinate;
        self.title = title;
        self.subtitle = subtitle;
        self.ranking = ranking;
    }
}
