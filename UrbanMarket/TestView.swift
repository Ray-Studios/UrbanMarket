//
//  TestView.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 7/12/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

import UIKit

class TestView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
    }
required     
    init(coder aDecoder: NSCoder!){
        super.init(coder: aDecoder);
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
        var context: CGContextRef = UIGraphicsGetCurrentContext();
        
        CGContextSetLineWidth(context, 2.0);
        
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor);
        
        var dash:[CGFloat]=[4.0,6.0]; // pattern 6 times “solid”, 5 times “empty”
        CGContextSetLineDash(context,2,dash,2);
        
        CGContextAddEllipseInRect(context, CGRectMake(rect.origin.x+1,rect.origin.y+1,rect.width-2,rect.height-2));
        
        CGContextStrokePath(context);
    }

}
