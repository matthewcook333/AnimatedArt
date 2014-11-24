//
//  DrawView.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/6/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class DrawView: UIView {
    // default color
    var drawColor = UIColor.blackColor()
    
    var tracePath: Bool = false
    
    // current animatable image
    var currentAnimatable: Animatable!
    // path for animation to follow
    var animationPath: UIBezierPath = UIBezierPath()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // init code here
        
        // TODO: placeholder image, will remove when user can draw images
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
        
        // TODO: placeholder new image
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
            // can change rotation mode if necessary
            // animation.rotationMode = kCAAnimationRotateAuto
            animation.repeatCount = Float.infinity
            // speed of animation. TODO: make adjustable
            animation.duration = 5.0
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
            // add point to path if currently making path
            var newPoint = touches.anyObject()!.locationInView(self)
            animationPath.addLineToPoint(newPoint)
            
            // this will call drawRect and redraw view
            self.setNeedsDisplay()
            
        }
    }
    
    // draws the path on each GUI refresh
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
