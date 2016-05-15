//
//  TractorSmokeView.swift
//  UrbanMarket
//
//  Created by Rohan Thomare on 4/5/15.
//  Copyright (c) 2015 TommyRayStudios. All rights reserved.
//

import UIKit


class TractorSmokeView: UIView {
    
    let DEFUALT_PATH_MAG:CGFloat = CGFloat(1.0);
    let DEFAULT_PATH_SPEED:CGFloat = CGFloat(1.0);
    
    var pathMagnitude:CGFloat = CGFloat(1.0);
    var pathSpeed:CGFloat = CGFloat(1.0);
    var initalSize:CGRect = CGRectZero;
    var expandedSize:CGRect = CGRectZero;
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
