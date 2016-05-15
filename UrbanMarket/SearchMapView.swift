//
//  SearchMapView.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 7/19/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

import UIKit
import MapKit

class SearchMapView: MKMapView {

    var staticCenterPinView: SearchPinAnnotation;

    
    override init(frame: CGRect) {
        self.staticCenterPinView = SearchPinAnnotation(coordinate: CLLocationCoordinate2DMake(0, 0), title: "", subtitle: "", ranking: 0);
        super.init(frame: frame)
        // Initialization code
    }
    
    required init(coder aDecoder: NSCoder) {
        
       self.staticCenterPinView = SearchPinAnnotation(coordinate: CLLocationCoordinate2DMake(0, 0), title: "", subtitle: "", ranking: 0);        super.init(coder: aDecoder);
    }
    
    override func layoutSubviews(){
        super.layoutSubviews();
        
        //add layer for circle
        
        
        /*move centerPinView to middle and add to self*/
        self.staticCenterPinView = SearchPinAnnotation(coordinate: CLLocationCoordinate2DMake(0, 0), title: "", subtitle: "", ranking: 0);
        
        var annotation: MKAnnotation = self.staticCenterPinView as MKAnnotation;
        self.addAnnotation(self.staticCenterPinView);

        //add dashed circle to mapView
        
        
    }
    


    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
