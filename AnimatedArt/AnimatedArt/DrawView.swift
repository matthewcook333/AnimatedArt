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
    var currentDrawSegment = UIBezierPath()
    
    // path for animation to follow
    var animationPath: UIBezierPath = UIBezierPath()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // init code here
        
        // TODO: placeholder image, will remove when user can draw images
        //currentAnimatable = Animatable(imageNamed: "ben.jpg")
        currentAnimatable = Animatable()
        self.layer.addSublayer(currentAnimatable)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "triggerRotation:", name: "rotate", object: nil)
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "triggerPathCreation:", name: "triggerPath", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "clearPath:", name: "clearPath", object: nil)

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
        //currentAnimatable = Animatable(imageNamed: "ran.jpg")
        //drawnImage.removeAll(keepCapacity: false)
        currentAnimatable = Animatable()
        self.layer.addSublayer(currentAnimatable)
        
        // remove path from view
        removeTranslationPaths()
        // remove old path
        animationPath = UIBezierPath()
    }
    
    func removeTranslationPaths() {
        for sublayer in self.layer.sublayers {
            if let path = sublayer as? Animatable {
                // do nothing as we want to keep animatables
            } else if let path = sublayer as? CAShapeLayer {
                path.removeFromSuperlayer()
            }
        }
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
    
    func clearPath(notification:NSNotification)
    {
        animationPath = UIBezierPath()
        removeTranslationPaths()
        // TODO: Fix so that path begins animating if user starts drawing a new one. Currently
        //  it does not as touchesBegan does not trigger animation. May need to do some refactoring
        //  to get this to work cleanly
        currentAnimatable.removeAnimationForKey("translation")
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if tracePath {
            animationPath.moveToPoint(touches.anyObject()!.locationInView(self))
        } else {
            currentDrawSegment.moveToPoint(touches.anyObject()!.locationInView(self))
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var newPoint = touches.anyObject()!.locationInView(self)
        if tracePath {
            // add point to dotted path if making animation
            animationPath.addLineToPoint(newPoint)
            
            let currentAnimation: CAAnimation? = currentAnimatable.animationForKey("translation")
            if currentAnimation != nil {
                var newAnimation: CAKeyframeAnimation = currentAnimation!.copy() as CAKeyframeAnimation
                newAnimation.path = animationPath.CGPath
                currentAnimatable.removeAnimationForKey("translation")
                currentAnimatable.addAnimation(newAnimation, forKey: "translation")
            }
        } else {
            // add point to image if drawing
            currentAnimatable.drawnImage.removeValueForKey(currentDrawSegment)
            currentDrawSegment.addLineToPoint(newPoint)
            currentAnimatable.drawnImage.updateValue((color: drawColor), forKey: currentDrawSegment)
        }
        // this will call drawRect and redraw view
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        currentAnimatable.drawnImage.updateValue((color: drawColor), forKey: currentDrawSegment)
        currentDrawSegment = UIBezierPath()
        
        self.setNeedsDisplay()
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
    
        
        //drawnImage.stroke()
        
        currentAnimatable.setNeedsDisplay()
    
        //currentAnimatable.path = drawnImage.CGPath
        

        // centers the drawing
        let bounds = CGPathGetBoundingBox(currentAnimatable.path)
        let rotationPoint = CGPoint(x:CGRectGetMidX(bounds), y:CGRectGetMidY(bounds))
        currentAnimatable.position = rotationPoint
        currentAnimatable.bounds = bounds
        

    }
}
