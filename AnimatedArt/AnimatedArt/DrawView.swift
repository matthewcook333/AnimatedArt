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
    

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // init code here
        
        currentAnimatable = Animatable(imageNamed: "sample.jpg")
        self.addSubview(currentAnimatable)
        
        // temporary background color
        backgroundColor = UIColor.lightGrayColor()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "triggerRotation:", name: "rotate", object: nil)
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "triggerPathCreation:", name: "triggerPath", object: nil)
    }
    
    func triggerRotation(notification:NSNotification) {
        
        let userInfo:Dictionary<String,CAAnimation!> = notification.userInfo as Dictionary<String,CAAnimation!>
        
        let animation :CAAnimation? = userInfo["animation"]
        
        currentAnimatable.layer.removeAnimationForKey("rotation")
        if animation != nil {
            currentAnimatable.layer.addAnimation(animation, forKey: "rotation")
        } else {
            //currentAnimatable.layer.removeAnimationForKey("rotation")
        }
    }
    
    func doneButtonPressed(sender:UIButton!)
    {
        currentAnimatable = Animatable(imageNamed: "sample.jpg")
        self.addSubview(currentAnimatable)
        
        NSNotificationCenter.defaultCenter().postNotificationName("done", object: nil, userInfo: [:])
    }
    
    func triggerPathCreation(notification:NSNotification)
    {
        tracePath = !tracePath
        // completed drawing path, animate along path now
        if !tracePath {
            var animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation")
            animation.duration = CFTimeInterval(30)
            animation.autoreverses = true
            animation.removedOnCompletion = false
            animation.repeatCount = Float.infinity
            animation.fillMode = kCAFillModeForwards
            animation.fromValue = NSValue(CGPoint: waypoints[0].start)
            animation.toValue = NSValue(CGPoint: waypoints[waypoints.count-1].end)
            currentAnimatable.layer.addAnimation(animation, forKey: "translation")

        }
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if tracePath {
            lastPoint = touches.anyObject()?.locationInView(self)
            currentAnimatable.center = lastPoint
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if tracePath {
            var newPoint = touches.anyObject()!.locationInView(self)
            waypoints.append(Line(start: lastPoint, end: newPoint, color: drawColor))
            lastPoint = newPoint
        
            currentAnimatable.center = lastPoint
        
            // this will redraw view
            self.setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        // set width of line
        CGContextSetLineWidth(context, 5)
        CGContextSetLineCap(context, kCGLineCapRound)
        for line in waypoints {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
            // set color of line
            CGContextSetStrokeColorWithColor(context, line.color.CGColor)
            CGContextStrokePath(context)
        }
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
