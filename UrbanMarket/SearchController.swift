//
//  SearchController.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 7/19/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

import UIKit
import MapKit

//constant colors
let searchBarBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7);
let searchBarTextColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);


class SearchController: UIViewController, UISearchBarDelegate, MKMapViewDelegate {

    @IBOutlet var productSearchBar: UISearchBar!
    @IBOutlet var locationSearchBar: UISearchBar!
    @IBOutlet var mapView: SearchMapView!
    
    var locationSearchOriginalFrame: CGRect
    var centerPinView: MKAnnotationView
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //Add view that doubles as search and selected listing
        //var searchAndItemFocusContainer = UIView(frame: CGRectMake(0,0,self.view.bounds.width,60));
        
        //add delegate for locationSearch
        self.locationSearchBar.delegate = self;
        self.mapView.delegate = self;
        
        //Add static pin to map
        //self.centerPinView = MKPinAnnotationView(frame: CGRectMake(self.view.bounds.width/2, self.view.bounds.size.height/2, 50, 50));
        //self.mapView.addSubview(self.centerPinView);
        
        //Make Textfield viewable
        
        self.locationSearchBar?.backgroundColor = searchBarBackgroundColor;
        self.productSearchBar?.backgroundColor = searchBarBackgroundColor;
        
        var textFieldInsideSearchBar = self.productSearchBar.valueForKey("searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = searchBarTextColor;
        var textFieldInsideSearchBarPlaceHolder = textFieldInsideSearchBar?.valueForKey("placeholderLabel") as? UILabel;
        textFieldInsideSearchBarPlaceHolder?.textColor = searchBarTextColor;
        
        textFieldInsideSearchBar = self.locationSearchBar.valueForKey("searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = searchBarTextColor;
        textFieldInsideSearchBarPlaceHolder = textFieldInsideSearchBar?.valueForKey("placeholderLabel") as? UILabel;
        textFieldInsideSearchBarPlaceHolder?.textColor = searchBarTextColor;
        
        //Get original frame of location search
        self.locationSearchOriginalFrame = self.locationSearchBar.frame;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //#pragma mark Search Bars Delegate Methods and Auxilary Functions
    
    func focusOnLocationSearch(){
        UIView.animateWithDuration(0.5, animations: {
           self.locationSearchBar.frame = self.productSearchBar.frame;
            self.productSearchBar.alpha = 0.0;
            });
    }
    
    @IBAction func resignSearch(sender: AnyObject) {
        self.returnLocationSearch();
        
    }
    
    func returnLocationSearch(){
        UIView.animateWithDuration(0.5, animations: {
            self.locationSearchBar.frame = self.locationSearchOriginalFrame;
        }, completion: {
            value in
            self.locationSearchBar.resignFirstResponder();
            self.productSearchBar.resignFirstResponder();
            UIView.animateWithDuration(1.0, animations: {
                self.productSearchBar.alpha = 1.0;
            });
        });
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.focusOnLocationSearch();
        
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar){
        
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        return true;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
    }
    
    required init(coder aDecoder: NSCoder) {
        
        self.centerPinView = MKAnnotationView();
        self.locationSearchOriginalFrame = CGRectZero;
        super.init(coder: aDecoder);
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if !(annotation is SearchPinAnnotation) {
            return nil
        }
        
        let reuseId = "test"
        
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView.canShowCallout = true
        }
        else {
            anView.annotation = annotation
        }
        
        //Set annotation-specific properties **AFTER**
        //the view is dequeued or created...
        
        var nibViews: NSArray = NSBundle.mainBundle().loadNibNamed("PinAnnotationView", owner: self, options: nil) as NSArray;
        anView.addSubview(nibViews[0] as! UIView);
        
        return anView
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
