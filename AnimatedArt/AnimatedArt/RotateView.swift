//
//  RotateView.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/18/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class RotateView: UIView {
    
    @IBOutlet weak var clockwiseButton :UIButton!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
       // NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateNotificationSentLabel", name: mySpecialNotificationKey, object: nil)

    }
    
    func rotateClockwise(sender:UIButton!)
    {
        sender.selected = !sender.selected
        NSNotificationCenter.defaultCenter().postNotificationName("animate", object: nil, userInfo: ["message":"blah"])
//        if sender.selected {
//            var animation = rotationAnimation(true, speed: 30)
//            
//        } else {
//            currentAnimatable.layer.removeAnimationForKey("90rotation")
//        }
    }
    
    var imgAngle: Double = 0;
    func rotationAnimation(clockwise: Bool, speed: Int)
    {
        var animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = CFTimeInterval(speed)
        animation.additive = true;
        animation.removedOnCompletion = false;
        animation.fillMode = kCAFillModeForwards;
        animation.fromValue = NSNumber(double:( imgAngle ) / 180.0 * M_PI )
        if clockwise {
            animation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) + 90)
        } else {
            animation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) - 90)
        }
        self.layer.addAnimation(animation, forKey: "90rotation")
        
        imgAngle+=90;
        if (imgAngle>360) {
            imgAngle = 0;
        }
    }
    
    

}
