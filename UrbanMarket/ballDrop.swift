//
//  ballDrop.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 7/19/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

import UIKit

class ballDrop: UIViewController {

    var animator:UIDynamicAnimator?
    var gravity: UIGravityBehavior;
    var behavior: UIDynamicItemBehavior;
    var collision: UICollisionBehavior;
    
    var ball: UIView;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor();
        
        self.ball.backgroundColor = UIColor.redColor();
        self.view.addSubview(self.ball);
        
        self.animator = UIDynamicAnimator(referenceView: self.view);
        
        self.gravity.addItem(self.ball);
        self.collision.addItem(self.ball);
        
        self.collision.addBoundaryWithIdentifier("bounceBoundry", fromPoint: CGPointMake(0, self.view.bounds.height), toPoint: CGPointMake(self.view.bounds.width, self.view.bounds.height));
        
        self.behavior.addItem(self.ball);
        self.behavior.elasticity = 0.4;
        
        animator!.addBehavior(gravity);
        animator!.addBehavior(collision);
        animator!.addBehavior(behavior);
        
        let pushSelector : Selector = Selector("pushUpBall:");
        
        var touchGesture = UITapGestureRecognizer(target: self,action: pushSelector);
        self.ball.addGestureRecognizer(touchGesture);

        // Do any additional setup after loading the view.
    }

    
    func pushUpBall(recognizer: UITapGestureRecognizer){
        var frame = recognizer.view!.frame;
        var view = recognizer.view;
        frame.origin.y -= 300.0;
        view!.frame = frame;
        UIView.animateWithDuration(1.0, animations: {
            
            
            }, completion:{ finished in
                //your stuff
                self.animator = UIDynamicAnimator(referenceView: self.view);
                
                self.gravity.addItem(self.ball);
                self.collision.addItem(self.ball);
                
                self.collision.addBoundaryWithIdentifier("bounceBoundry", fromPoint: CGPointMake(0, self.view.bounds.height), toPoint: CGPointMake(self.view.bounds.width, self.view.bounds.height));
                
                self.behavior.addItem(self.ball);
                self.behavior.elasticity = 0.4;
                
                self.animator!.addBehavior(self.gravity);
                self.animator!.addBehavior(self.collision);
                self.animator!.addBehavior(self.behavior);

            }
        );
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init(coder aDecoder: NSCoder) {
        self.animator = UIDynamicAnimator();
        self.gravity =  UIGravityBehavior();
        self.gravity.magnitude += 3.0;
        self.behavior = UIDynamicItemBehavior();
        self.collision = UICollisionBehavior();
        self.ball = UIView(frame: CGRectMake(120, 40, 80, 80));
        super.init(coder: aDecoder);
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
