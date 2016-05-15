//
//  SearchTableView.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 7/15/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

import UIKit

class SearchTableView: UITableView, UITableViewDelegate{
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        // Initialization code
        
    }
    
    required init(coder aDecoder: NSCoder!){
        super.init(coder: aDecoder);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        //var blur = UIToolbar(frame:CGRectMake(0, 0, self.frame.width, self.frame.height));
        //blur.autoresizingMask = UIViewAutoresizing.FlexibleHeight;
        //blur.barStyle = UIBarStyle.Black;
        //blur.translucent = true;

        
        //self.addSubview(blur);
       //self.sendSubviewToBack(blur);
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