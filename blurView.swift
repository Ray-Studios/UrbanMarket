//
//  blurView.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 7/15/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

import UIKit

class blurView: UIVisualEffectView {

    init(effect: UIVisualEffect!){
        super.init(effect: effect);
    }

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
        // Get the current graphics context
        var context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor( context, UIColor.redColor().CGColor );
        CGContextFillRect(context, rect);
        if(CGRectIntersectsRect(rect, rect))
        {
            CGContextSetFillColorWithColor(context, UIColor.clearColor().CGColor);
            CGContextFillEllipseInRect(context, rect );
        }
    }
    

}
