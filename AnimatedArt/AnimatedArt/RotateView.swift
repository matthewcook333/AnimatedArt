//
//  RotateView.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/18/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class RotateView: UIView {
    
    //@IBOutlet weak var clockwiseButton :UIButton!
    @IBOutlet weak var directionButton :UISegmentedControl!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       // NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateNotificationSentLabel", name: mySpecialNotificationKey, object: nil)

    }
    
    
    
    func createRotation(sender:UISegmentedControl!)
    {
        if sender.selectedSegmentIndex == 1 {
            let animation:CAAnimation = rotationAnimation(true, speed: 30)
            NSNotificationCenter.defaultCenter().postNotificationName("rotate", object: nil, userInfo: ["animation":animation])
        } else if sender.selectedSegmentIndex == 2 {
            let animation:CAAnimation = rotationAnimation(false, speed: 30)
            NSNotificationCenter.defaultCenter().postNotificationName("rotate", object: nil, userInfo: ["animation":animation])
        }
        else {
            NSNotificationCenter.defaultCenter().postNotificationName("rotate", object: nil, userInfo: [:])
            
        }
        
//        sender.selected = !sender.selected
//
//        
//        
//        if sender.selected {
//            let animation:CAAnimation = rotationAnimation(true, speed: 30)
//            NSNotificationCenter.defaultCenter().postNotificationName("rotate", object: nil, userInfo: ["animation":animation])
//        } else {
//            NSNotificationCenter.defaultCenter().postNotificationName("rotate", object: nil, userInfo: [:])
//
//        }
        
        
    }
    
    var imgAngle: Double = 0;
    func rotationAnimation(clockwise: Bool, speed: Int) -> CAAnimation
    {
        var animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = CFTimeInterval(speed)
        animation.additive = true;
        animation.removedOnCompletion = false;
        animation.repeatCount = Float.infinity
        animation.fillMode = kCAFillModeForwards;
        animation.fromValue = NSNumber(double:( imgAngle ) / 180.0 * M_PI )
        if clockwise {
            animation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) + 90)
        } else {
            animation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) - 90)
        }
        //self.layer.addAnimation(animation, forKey: "90rotation")
        
        imgAngle+=90;
        if (imgAngle>360) {
            imgAngle = 0;
        }
        
        return animation
    }
    
    

}
