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
    
//    var lastUpdateTime: NSTimeInterval = 0.0
//    var dt: NSTimeInterval = 0.0
    
    // example image to animate
    var currentAnimatable: Animatable!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // init code here
        
        currentAnimatable = Animatable(imageNamed: "sample.jpg")
        
        // temporary background color
        backgroundColor = UIColor.lightGrayColor()
       
    }
    
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
    
    func doneButtonPressed(sender:UIButton!)
    {
        print("hahaha")
    }
    
    func triggerPathCreation(sender:UIButton!)
    {
        sender.selected = !sender.selected;
        
        if sender.selected {
            tracePath = true
        } else {
            tracePath = false
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
    
    
}
