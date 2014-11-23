//
//  Animatable.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/14/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class Animatable: CALayer {
    
    init(imageNamed name: String!) {
        super.init()
        //super.init(frame: CGRectMake(100, 150, 150, 150))
        self.contents = UIImage(named: name)
        //self.image = UIImage(named: name)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    var imgAngle: Double = 0;
//    func doRotate(clockwise: Bool, speed: Int)
//    {
//        var animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
//        animation.duration = CFTimeInterval(speed)
//        animation.additive = true;
//        animation.removedOnCompletion = false;
//        animation.fillMode = kCAFillModeForwards;
//        animation.fromValue = NSNumber(double:( imgAngle ) / 180.0 * M_PI )
//        if clockwise {
//            animation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) + 90)
//        } else {
//            animation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) - 90)
//        }
//        self.layer.addAnimation(animation, forKey: "90rotation")
//        
//        imgAngle+=90;
//        if (imgAngle>360) {
//            imgAngle = 0;
//        }
//    }
    
    
    

}
