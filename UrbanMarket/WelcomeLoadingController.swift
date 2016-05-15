//
//  ViewController.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 7/8/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

import UIKit
import QuartzCore



class WelcomeLoadingController: UIViewController {
    
    let LOADING_TO_SEARCH_SEGUE = "loadingToMapSegue";
    
    @IBOutlet var loadingSpinner: UIActivityIndicatorView!
    @IBOutlet var loadingLabel: UILabel!
    @IBOutlet var loadingView: FarmLoadingView!
    @IBOutlet var tractorBody: UIView!
    @IBOutlet var tractorWheels: UIView!
    
    var animator:UIDynamicAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skyBase: UInt32 = 0;
        let skyMax: UInt32 = (UInt32(floor(self.view.bounds.size.height)))/6;
        let speedBase: UInt32 = 30;
        let speedMax: UInt32 = 50;
        let numberClouds: UInt32 = self.randomNumberBetween(6, andMax: 8);
        let cloudWidth :CGFloat = 100.0;
        let cloudHeight :CGFloat = 55.0;
        
        
        for  index in 1...numberClouds{
            
            let skyPoint = CGFloat(self.randomNumberBetween(skyBase, andMax: skyMax));
            let speed = NSTimeInterval(self.randomNumberBetween(speedBase, andMax: speedMax));
            let delay = NSTimeInterval(self.randomNumberBetween(0, andMax: 6));
            let sideFlip = self.randomNumberBetween(0, andMax: 1);
            var startPoint: CGFloat = 0.0;
            var endPoint :CGFloat = 0.0;
            
            startPoint = self.view.bounds.width;
            endPoint = startPoint - (self.view.bounds.size.width + cloudWidth);
            if(sideFlip == 1){
                //swap values
                var temp = startPoint;
                startPoint = endPoint;
                endPoint = temp;
            }
            
            var cloud: UIImageView = UIImageView(frame: CGRectMake(startPoint, skyPoint, cloudWidth, cloudHeight));
            cloud.image = UIImage(named: "cloud\(self.randomNumberBetween(1, andMax: 3)).png");
            cloud.contentMode = UIViewContentMode.ScaleAspectFit;
            
            var center = cloud.center;
            center.x = endPoint;
            self.view.addSubview(cloud);
            UIView.animateWithDuration(speed, delay: delay, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: {
                cloud.center = center;
                
                }, completion: nil);
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        var timer = NSTimer.scheduledTimerWithTimeInterval(2 , target: self, selector: "timerFireMethod:", userInfo: 0, repeats: false);
        
        self.animator = UIDynamicAnimator(referenceView: self.view);
        
        var gravity = UIGravityBehavior(items: [self.tractorBody]);
        var collision = UICollisionBehavior(items: [self.tractorBody]);
        
        var rightEdge = CGPointMake(self.tractorWheels.frame.origin.x+self.tractorWheels.frame.size.width,self.tractorWheels.frame.origin.y+self.tractorWheels.frame.height/1.4)
        
        collision.addBoundaryWithIdentifier("bottomBarrier", fromPoint: CGPointMake(self.tractorWheels.frame.origin.x,self.tractorWheels.frame.origin.y+self.tractorWheels.frame.height/1.4), toPoint: rightEdge);
        collision.addBoundaryWithIdentifier("leftBarrier", fromPoint: CGPointMake(self.tractorWheels.frame.origin.x,self.tractorWheels.frame.origin.y), toPoint: CGPointMake(self.tractorWheels.frame.origin.x,self.tractorWheels.frame.origin.y+self.tractorBody.frame.height));
        collision.addBoundaryWithIdentifier("rightBarrier", fromPoint: CGPointMake(self.tractorWheels.frame.origin.x,self.tractorWheels.frame.origin.y),toPoint: CGPointMake(self.tractorWheels.frame.origin.x,self.tractorWheels.frame.origin.y+self.tractorBody.frame.height));
        
        var behavior = UIDynamicItemBehavior(items: [self.tractorBody]);
        behavior.elasticity = 0.975;
        
        animator!.addBehavior(gravity);
        animator!.addBehavior(collision);
        animator!.addBehavior(behavior);
        
    }
    
    func timerFireMethod(timer: NSTimer) {
        self.loadingView.swing();
        self.loadingLabel.text = "Done!";
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "doneLoading:", userInfo: 0, repeats: false);
    }
    
    func doneLoading(timer: NSTimer){
        self.loadingSpinner.stopAnimating();
        self.loadingView.zoomIntoBarn({
            complete in
            self.performSegueWithIdentifier(self.LOADING_TO_SEARCH_SEGUE, sender: nil);
        });
    }
    
    func randomNumberBetween(base: UInt32, andMax: UInt32) -> UInt32{
        return base + arc4random_uniform((andMax-base)+1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder);

    }

}
