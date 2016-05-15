/* Playground - noun: a place where people can play*/

import UIKit
import MapKit
/*
class product{
    var id: UInt;
    var name: String;
    var quantity: UInt;
    
    init(){
        self.id = 0;
        self.name = "";
        self.quantity = 0;
    }
    
    init(id: UInt, name: String, quantity: UInt){
        self.id = id;
        self.name = name;
        self.quantity = quantity;
    }
}

class farmer{
    var id: UInt;
    var name: String;
    var products: NSMutableArray;
    var location: CLLocationCoordinate2D;
    
    init(){
        self.id = 0;
        self.name = "";
        self.location = CLLocationCoordinate2DMake(0, 0);
        self.products = NSMutableArray();
    
    }
    
    init(id: UInt, name: String, location: CLLocationCoordinate2D, products: NSArray){
        self.id = id;
        self.name = name;
        self.location = CLLocationCoordinate2DMake(location.latitude, location.longitude);
        self.products = NSMutableArray(array:products);
    }
}*/

@IBDesignable

class phoneView:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame);
        //initalization code
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@IBDesignable
class ballView:UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        //initalization code
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/*
@IBDesignable
class searchResultCell:UIView{
    
    init(frame: CGRect) {
        super.init(frame: frame);
        //initalization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        var blurView:UIToolbar = UIToolbar(frame: self.frame);
        blurView.autoresizingMask = UIViewAutoresizing.FlexibleHeight;
        blurView.barStyle = UIBarStyle.Black;
        blurView.translucent = true;
        self.addSubview(blurView);
        self.sendSubviewToBack(blurView);
        
    }
    //only use if needed otherwise comment out. (effects performance)
    /*override func drawRect(rect: CGRect) {
        
    }*/
    
}*/
var phone = phoneView(frame: CGRectMake(0, 0, 320, 568));
phone.backgroundColor = UIColor.blueColor();

/*var ball = ballView(frame: CGRectMake(140, 20, 40, 40), color: UIColor.redColor());
phone.addSubview(ball);

var animator = UIDynamicAnimator(referenceView: phone);

var gravity = UIGravityBehavior(items: [ball]);
var collision = UICollisionBehavior(items: [ball]);

var behavior = UIDynamicItemBehavior(items: [ball]);
behavior.elasticity = 0.975;

animator.addBehavior(gravity);
animator.addBehavior(collision);
animator.addBehavior(behavior);*/

phone;

var sub = MKPinAnnotationView(frame: CGRectMake(0,0,100,100));
sub.backgroundColor = UIColor.greenColor();
phone.addSubview(sub);

var bundle = NSBundle.mainBundle();
var img = UIImage(named: "annotation.png");
var imgView = UIImageView(image: img);







