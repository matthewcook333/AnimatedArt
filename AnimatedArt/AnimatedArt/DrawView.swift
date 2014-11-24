//
//  DrawView.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/6/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var waypoints: [Line] = []
    var lastPoint: CGPoint!
    // default color
    var drawColor = UIColor.blackColor()
    
    var tracePath: Bool = false
    
    // example image to animate
    var currentAnimatable: Animatable!
    
    
    // path for animation to follow
    var animationPath: UIBezierPath = UIBezierPath()
    

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // init code here
        
        currentAnimatable = Animatable(imageNamed: "ben.jpg")
        self.layer.addSublayer(currentAnimatable)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "triggerRotation:", name: "rotate", object: nil)
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "triggerPathCreation:", name: "triggerPath", object: nil)
    }
    
    func triggerRotation(notification:NSNotification) {
        
        let userInfo:Dictionary<String,CAAnimation!> = notification.userInfo as Dictionary<String,CAAnimation!>
        
        let animation :CAAnimation? = userInfo["animation"]
        
        currentAnimatable.removeAnimationForKey("rotation")
        if animation != nil {
            currentAnimatable.addAnimation(animation, forKey: "rotation")
        } else {
            //currentAnimatable.layer.removeAnimationForKey("rotation")
        }
    }
    
    func doneButtonPressed(sender:UIButton!)
    {
        NSNotificationCenter.defaultCenter().postNotificationName("done", object: nil, userInfo: [:])
        
        currentAnimatable = Animatable(imageNamed: "ran.jpg")
        self.layer.addSublayer(currentAnimatable)
        
        // remove old path
        animationPath = UIBezierPath()
    }
    
    func triggerPathCreation(notification:NSNotification)
    {
        tracePath = !tracePath
        // completed drawing path, animate along path now
        if !tracePath {
            var animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
            animation.path = animationPath.CGPath
            // can change rotation mode
            // animation.rotationMode = kCAAnimationRotateAuto
            animation.repeatCount = Float.infinity
            animation.duration = 1.0
            animation.autoreverses = true
            // allows for constant speed
            animation.calculationMode = kCAAnimationCubicPaced
            currentAnimatable.addAnimation(animation, forKey: "translation")
        }
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if tracePath {
            animationPath.moveToPoint(touches.anyObject()!.locationInView(self))
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if tracePath {
            var newPoint = touches.anyObject()!.locationInView(self)
            
            // new code
            animationPath.addLineToPoint(newPoint)
            
            // this will redraw view
            self.setNeedsDisplay()
            
        }
    }
    
    override func drawRect(rect: CGRect) {
        var trackPath: CAShapeLayer = CAShapeLayer()
        trackPath.path = animationPath.CGPath;
        trackPath.strokeColor = UIColor.blackColor().CGColor
        trackPath.fillColor = UIColor.clearColor().CGColor
        trackPath.lineWidth = 2.0;
        trackPath.lineDashPattern = [6, 2]
        self.layer.addSublayer(trackPath)
    }
}
