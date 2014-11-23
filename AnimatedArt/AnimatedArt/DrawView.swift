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
        
        currentAnimatable = Animatable(imageNamed: "sample.jpg")
        self.layer.addSublayer(currentAnimatable)
        
        // temporary background color
        backgroundColor = UIColor.lightGrayColor()
        
        
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
        currentAnimatable = Animatable(imageNamed: "sample.jpg")
        self.layer.addSublayer(currentAnimatable)
        
        NSNotificationCenter.defaultCenter().postNotificationName("done", object: nil, userInfo: [:])
    }
    
    func triggerPathCreation(notification:NSNotification)
    {
        tracePath = !tracePath
        // completed drawing path, animate along path now
        if !tracePath {
            // now we have Animatable as sublayer
//            var animatableLayer: CALayer = CALayer()
//            animatableLayer.bounds = currentAnimatable.bounds
//            animatableLayer.position = animationPath.currentPoint
//            //animatableLayer.contents = currentAnimatable.image?.CGImage
//            animatableLayer.contents = currentAnimatable.lcontents
//            self.layer.addSublayer(animatableLayer)
        
            
            var animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
            animation.path = animationPath.CGPath
            // can change rotation mode
            animation.rotationMode = kCAAnimationRotateAuto
            animation.repeatCount = Float.infinity
            animation.duration = 10.0
            animation.autoreverses = true
            // allows for constant speed
            animation.calculationMode = kCAAnimationCubicPaced
            currentAnimatable.addAnimation(animation, forKey: "translation")
            
            print("triggered path creation")
            
            
        }
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if tracePath {
            //lastPoint = touches.anyObject()?.locationInView(self)
            //currentAnimatable.center = lastPoint
            
            animationPath.moveToPoint(touches.anyObject()!.locationInView(self))
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if tracePath {
            var newPoint = touches.anyObject()!.locationInView(self)
            //waypoints.append(Line(start: lastPoint, end: newPoint, color: drawColor))
            //lastPoint = newPoint
        
            //currentAnimatable.center = lastPoint
            
            // new code
            animationPath.addLineToPoint(newPoint)
            
            
            // this will redraw view
            self.setNeedsDisplay()
            
        }
    }
    
    override func drawRect(rect: CGRect) {
//        var context = UIGraphicsGetCurrentContext()
//        CGContextBeginPath(context)
//        // set width of line
//        CGContextSetLineWidth(context, 5)
//        CGContextSetLineCap(context, kCGLineCapRound)
//        for line in waypoints {
//            CGContextMoveToPoint(context, line.start.x, line.start.y)
//            CGContextAddLineToPoint(context, line.end.x, line.end.y)
//            // set color of line
//            CGContextSetStrokeColorWithColor(context, line.color.CGColor)
//            CGContextStrokePath(context)
//        }
        
        var trackPath: CAShapeLayer = CAShapeLayer()
        trackPath.path = animationPath.CGPath;
        trackPath.strokeColor = UIColor.blackColor().CGColor
        trackPath.fillColor = UIColor.clearColor().CGColor
        trackPath.lineWidth = 10.0;
        self.layer.addSublayer(trackPath)
    }
    
//    func rotateClockwise(sender:UIButton!)
//    {
//        sender.selected = !sender.selected
//        
//        if sender.selected {
//            currentAnimatable.doRotate(true, speed: 30)
//        } else {
//            currentAnimatable.layer.removeAnimationForKey("90rotation")
//        }
//    }

    
    
    
    //    func move(dt: NSTimeInterval) {
    //        let currentPosition = position
    //        var newPosition = position
    //
    //        // if there are no more, we are done
    //        if waypoints.count > 0 {
    //            let targetPoint = wayPoints[0]
    //
    //            // calculate direction vector
    //            let offset = CGPoint(x: targetPoint.x - currentPosition.x, y: targetPoint.y - currentPosition.y)
    //            let length = Double(sqrtf(Float(offset.x * offset.x) + Float(offset.y * offset.y)))
    //            let direction = CGPoint(x:CGFloat(offset.x) / CGFloat(length), y: CGFloat(offset.y) / CGFloat(length))
    //            velocity = CGPoint(x: direction.x * POINTS_PER_SEC, y: direction.y * POINTS_PER_SEC)
    //
    //            // calculate new position
    //            newPosition = CGPoint(x:currentPosition.x + velocity.x * CGFloat(dt), y:currentPosition.y + velocity.y * CGFloat(dt))
    //            position = newPosition
    //
    //            // removing waypoints to always have next one as first
    //            if frame.contains(targetPoint) {
    //                wayPoints.removeAtIndex(0)
    //            }
    //        }
    //    }
    
}
