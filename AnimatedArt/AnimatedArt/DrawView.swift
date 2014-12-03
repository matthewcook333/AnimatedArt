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
        
        let userInfo:Dictionary<String, Int!> = notification.userInfo as Dictionary<String, Int!>
        
        let clockwise :Int! = userInfo["clockwise"]
        let speed :Int! = userInfo["speed"]
        
        let currentAnimation :CAAnimation? = currentAnimatable.animationForKey("rotation")
        // if there is already rotation, and user changed properties of it
        if (currentAnimation != nil && clockwise != nil && speed != nil) {
            var newAnimation :CABasicAnimation = currentAnimation!.copy() as CABasicAnimation
            newAnimation.duration = CFTimeInterval(speed)
            // 1 is clockwise on segment bar
            if clockwise == 1 {
                newAnimation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) + 90)
            } else {
                newAnimation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) - 90)
            }
            currentAnimatable.removeAnimationForKey("rotation")
            currentAnimatable.addAnimation(newAnimation, forKey: "rotation")
        // if user added rotation animation
        } else if (clockwise != nil && speed != nil) {
            let animation :CAAnimation = rotationAnimation(clockwise, speed: speed)
            currentAnimatable.addAnimation(animation, forKey: "rotation")
        // if user removed rotation
        } else {
            currentAnimatable.removeAnimationForKey("rotation")
        }
    }
    
    var imgAngle: Double = 0;
    func rotationAnimation(clockwise: Int, speed: Int) -> CAAnimation
    {
        var animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = CFTimeInterval(speed)
        animation.additive = true;
        animation.removedOnCompletion = false;
        animation.repeatCount = Float.infinity
        animation.fillMode = kCAFillModeForwards;
        animation.fromValue = NSNumber(double:( imgAngle ) / 180.0 * M_PI )
        if clockwise == 1{
            animation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) + 90)
        } else {
            animation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) - 90)
        }
        
        imgAngle+=90;
        if (imgAngle>360) {
            imgAngle = 0;
        }
        
        return animation
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
        let userInfo:Dictionary<String, Int!> = notification.userInfo as Dictionary<String, Int!>
        
        let speed: Int! = userInfo["speed"]
        let buttonTrigger: Int? = userInfo["buttonTrigger"]
        
        // if draw path button triggered, allow path drawing
        if buttonTrigger != nil {
            tracePath = !tracePath
        }
        
        let currentAnimation: CAAnimation? = currentAnimatable.animationForKey("translation")
        if (currentAnimation == nil) {
            var animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
            animation.path = animationPath.CGPath
            animation.repeatCount = Float.infinity
            // speed of animation. TODO: scale with length of path
            animation.duration = CFTimeInterval(speed)
            animation.autoreverses = true
            // allows for constant speed per path segment
            animation.calculationMode = kCAAnimationCubicPaced
            currentAnimatable.addAnimation(animation, forKey: "translation")
        } else {
            var newAnimation: CAKeyframeAnimation = currentAnimation!.copy() as CAKeyframeAnimation
            // TODO: Scale with length of path
            newAnimation.duration = CFTimeInterval(speed)
            currentAnimatable.removeAnimationForKey("translation")
            currentAnimatable.addAnimation(newAnimation, forKey: "translation")
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
            
            let currentAnimation: CAAnimation? = currentAnimatable.animationForKey("translation")
            if currentAnimation != nil {
                var newAnimation: CAKeyframeAnimation = currentAnimation!.copy() as CAKeyframeAnimation
                newAnimation.path = animationPath.CGPath
                currentAnimatable.removeAnimationForKey("translation")
                currentAnimatable.addAnimation(newAnimation, forKey: "translation")
            }
            
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
