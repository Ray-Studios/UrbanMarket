//
//  SearchViewController.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 7/13/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
/*

import UIKit
import MapKit

class SearchViewController: UIViewController, MKMapViewDelegate{
    
    @IBOutlet var radiusNumberLabel: UILabel!
    @IBOutlet var searchTable: SearchTableView!
    @IBOutlet var searchMapView: SearchMapView!
    var pinView: UIView;
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.searchMapView.delegate = self;
    
        self.searchTable.registerNib(UINib(nibName: "SearchTableCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "SearchCell");
        
        self.searchTable.delegate = self.searchTable;

        self.updateRadiusLabel();
    }
    
    func updateRadiusLabel(){
        //initalize radius label
        var leftMost:CLLocationCoordinate2D = self.searchMapView.convertPoint(CGPointMake(0, self.searchMapView.frame.height/2), toCoordinateFromView: self.searchMapView);
        var rightMost:CLLocationCoordinate2D = self.searchMapView.convertPoint(CGPointMake(self.searchMapView.frame.width,self.searchMapView.frame.height/2), toCoordinateFromView: self.searchMapView);
        
        var distance: CLLocationDistance = CLLocation(latitude: leftMost.latitude,
            longitude: leftMost.longitude).distanceFromLocation(CLLocation(latitude: rightMost.latitude,
                longitude: rightMost.longitude));
        
        var mi_distance = distance * 0.000621371192;
        radiusNumberLabel.text = "\(((Double)((Int)(distance*100))/100.0))"
        
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {

        if(annotation.isKindOfClass(SearchPinAnnotation)){
            let searchAnnotation = annotation as! SearchPinAnnotation;
            //var view =  searchAnnotation.annotationView();
            var frame = view.frame;
            
        }
        return nil;
    }

    func mapView(mapView: MKMapView!, regionWillChangeAnimated animated: Bool) {
        //update radius
        self.updateRadiusLabel();
    }
    
    func randomNumberBetween(base: Double, andMax: Double) -> Double{
        let ARC4RANDOM_MAX  = 0x100000000
        var val: Double = (Double(arc4random()) / Double(ARC4RANDOM_MAX))
            * (andMax - base)
            + base;
        NSLog("Random Value: \(val)");
        return val;
    }
    

    @IBAction func blah(sender: AnyObject) {
        var leftMost:CLLocationCoordinate2D = self.searchMapView.convertPoint(CGPointMake(0, self.searchMapView.frame.height/2), toCoordinateFromView: self.searchMapView);
        var rightMost:CLLocationCoordinate2D = self.searchMapView.convertPoint(CGPointMake(self.searchMapView.frame.width,self.searchMapView.frame.height/2), toCoordinateFromView: self.searchMapView);
        var topMost:CLLocationCoordinate2D = self.searchMapView.convertPoint(CGPointMake(self.searchMapView.frame.width/2, 0), toCoordinateFromView: self.searchMapView);
        var bottomMost:CLLocationCoordinate2D = self.searchMapView.convertPoint(CGPointMake(self.searchMapView.frame.width/2,self.searchMapView.frame.height), toCoordinateFromView: self.searchMapView);
        
        for i in 1...10{
            //drop some PINS!!
            var lat:CLLocationDegrees = 0.0;
            var long: CLLocationDegrees = 0.0;
            if(leftMost.longitude > rightMost.longitude){
                long = self.randomNumberBetween(rightMost.longitude, andMax: leftMost.longitude);
            }
            else{
                long = self.randomNumberBetween(leftMost.longitude, andMax: rightMost.longitude);
            }
            if(bottomMost.latitude > topMost.latitude){
                lat = self.randomNumberBetween(topMost.latitude, andMax: bottomMost.latitude);
            }
            else{
                lat = self.randomNumberBetween(bottomMost.latitude, andMax: topMost.latitude);
            }
            
            var pinCoord = CLLocation(latitude: lat, longitude: long);
            var leftMost = CLLocation(latitude: leftMost.latitude, longitude: leftMost.longitude);
            var center = CLLocation(latitude: self.searchMapView.centerCoordinate.latitude, longitude: self.searchMapView.centerCoordinate.longitude);
            
            var dist1 = pinCoord.distanceFromLocation(center);
            var dist2 = leftMost.distanceFromLocation(center)
            
            if(pinCoord.distanceFromLocation(center) <= leftMost.distanceFromLocation(center)){
                var searchPin: SearchPinAnnotation = SearchPinAnnotation(coordinate: CLLocationCoordinate2DMake(lat, long), title: "Farmer \(i)", subtitle: "#\(i)",image: UIImage(named: "annotationWithShadow.png")!);
                self.searchMapView.addAnnotation(searchPin);
            }
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init(coder aDecoder: NSCoder) {
        self.pinView = UIView();
        super.init(coder: aDecoder);
    }
    
    
    
    
   /* func sampleSearchData()->NSDictionary{
        var dictionary:NSMutableDictionary = NSMutableDictionary();
        
    }*/
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //DATA DELEGATE
    
    func tableView(tableView: UITableView!,
        numberOfRowsInSection section: Int) -> Int{
            return 5;
    }
    
    func tableView(tableView: UITableView!,
        cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
            var cell = tableView.dequeueReusableCellWithIdentifier("SearchCell", forIndexPath: indexPath) as! UITableViewCell;
            if (cell.isEqual(nil) || !(cell.isKindOfClass(SearchCell)))
            {
                // Load the top-level objects from the custom cell XIB.
                return SearchCell.getView(indexPath.row, title: "Farmer \(indexPath.row)", approvalPercent: Double(indexPath.row)*10.0, productLabels: ["Mango,", "Apple"]) as! UITableViewCell;
                // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            }
            var searchCell = cell as! SearchCell
            searchCell.title.text = "Farmer \(indexPath.row)";
            searchCell.approval.text = "\(Double(indexPath.row)*10.0)%"
            searchCell.productLabel1.text = "Mango,";
            searchCell.productLabel2.text = "Apple";
            searchCell.productLabel3.text = "";
            searchCell.productLabel4.text = "";
            searchCell.numberLabel.text = "\(indexPath.row)";
            return searchCell
            ;
    }
    

    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int{
        return 1;
    }

}*/
