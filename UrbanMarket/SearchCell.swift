//
//  SearchCell.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 7/15/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

import UIKit
import QuartzCore

class SearchCell: UITableViewCell {
    
    @IBOutlet var numberContainer: UIView!
    @IBOutlet var title: UILabel!
    @IBOutlet var approval: UILabel!
    @IBOutlet var productLabel1: UILabel!
    @IBOutlet var productLabel2: UILabel!
    @IBOutlet var productLabel3: UILabel!
    @IBOutlet var productLabel4: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier);
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func getView(number: Int, title: String, approvalPercent: Double, productLabels: NSArray)->AnyObject{
        
        var searchCellView: SearchCell = NSBundle.mainBundle().loadNibNamed("SearchTableCell", owner:nil, options:nil)[0] as! SearchCell;
        
        searchCellView.title.text = title;
        
        var products: NSArray = [searchCellView.productLabel1,searchCellView.productLabel2,searchCellView.productLabel3,searchCellView.productLabel4];
        
        for i in 0...3{
            var label:UILabel = products.objectAtIndex(i) as! UILabel
            if(i < productLabels.count){
                label.text = productLabels.objectAtIndex(i) as! String;
            }
            else{
                label.text = "";
            }
        }
        
        var percentApproval: Double = Double(floor(approvalPercent*100.0)/100.0);
        searchCellView.approval.text = "\(percentApproval)%";
        
        //add white circle around number view
        var radius = CGFloat(Int(searchCellView.numberContainer.frame.width/2));
        var circlePath = UIBezierPath(roundedRect: CGRectMake(0.0, 0.0, 2.0*radius, 2.0*radius), cornerRadius: radius);
        
        var fillLayer = CAShapeLayer();
        fillLayer.path = circlePath.CGPath;
        fillLayer.strokeColor = UIColor.whiteColor().CGColor;
        fillLayer.fillColor = UIColor.clearColor().CGColor;
        fillLayer.lineWidth = 2.0;
        
        searchCellView.numberContainer.layer.addSublayer(fillLayer);
        
        searchCellView.numberLabel.text = "\(number)";
        
        return searchCellView;
        
        
        

    }/*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
