//
//  FarmLoadingView.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 7/8/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

import UIKit
import QuartzCore

class FarmLoadingView: UIView {
    
    @IBOutlet var barnInside: UIView!
    @IBOutlet var leftDoor: UIView!
    @IBOutlet var rightDoor: UIView!
    var open = false;
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews();
        // Initialization code
        self.leftDoor.layer.anchorPoint = CGPointMake(0, 0.5);
        leftDoor.center = CGPointMake(0.0, barnInside.bounds.size.height/2.0);
        self.rightDoor.layer.anchorPoint = CGPointMake(1, 0.5);
        rightDoor.center = CGPointMake(barnInside.bounds.size.width,barnInside.bounds.size.height/2.0); //compensate for anchor offset\
        
        var pointToScaleTo :CGPoint = barnInside.center; //Just enter the coordinates you
        //want to scale your view towards
        var viewWidth :CGFloat = self.bounds.size.width;
        var viewHeight :CGFloat = self.bounds.size.height;
        
        //I divide the x and y coordinates by the view width and height
        //because the anchor point coordinates are normalized to the range
        //0.0-1.0.
        self.layer.anchorPoint = CGPointMake(pointToScaleTo.x/viewWidth, pointToScaleTo.y/viewHeight);
        var anchor = CGPointMake(pointToScaleTo.x/viewWidth, pointToScaleTo.y/viewHeight);
        var Diffy = pointToScaleTo.y-viewHeight/2;
        var Diffx = pointToScaleTo.x-viewWidth/2;
        
        self.center = CGPointMake(viewWidth/2.0 + Diffx, viewHeight/2.0 + Diffy);
    }
    
    @IBAction func swing(){
        var transform = CATransform3DIdentity
        
        transform.m34 = -1.0/500;
        
        UIView.animateWithDuration(0.5, animations: {
            if(!self.open){
                var rotate :CGFloat = 3.14/1.7;
                self.leftDoor.layer.transform = CATransform3DRotate(transform, -rotate, 0, 1, 0);
                self.rightDoor.layer.transform = CATransform3DRotate(transform, rotate, 0, 1, 0);
            }
            else
            {
                self.leftDoor.layer.transform = transform;
                self.rightDoor.layer.transform = transform;
            }
            self.open = !self.open;
        });
    }
    
    
    func zoomIntoBarn(done: ((Bool) -> Void)?){
        UIView.animateWithDuration(1.0, animations: {
            var scaleFactorX :CGFloat = 80;
            var scaleFactorY :CGFloat = 80;
            
            var scaleTransform :CGAffineTransform = CGAffineTransformMakeScale(scaleFactorX, scaleFactorY);
            //Now that the anchor point has been changed, apply the scale transform
            self.layer.transform = CATransform3DMakeAffineTransform(scaleTransform);
            }, completion: done); //call the done function after animation
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
