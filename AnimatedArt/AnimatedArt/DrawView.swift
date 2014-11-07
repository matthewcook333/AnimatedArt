//
//  DrawView.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/6/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    // default color
    var drawColor = UIColor.blackColor()
    
    // example image to animate
    @IBOutlet weak var stickdude: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // init code here
        
        // temporary background color
        backgroundColor = UIColor.lightGrayColor()
        
        // temp image to animate
        stickdude.image = UIImage(named:"rPQSRp6.jpg");
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        lastPoint = touches.anyObject()?.locationInView(self)
        stickdude.center = lastPoint
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var newPoint = touches.anyObject()!.locationInView(self)
        lines.append(Line(start: lastPoint, end: newPoint, color: drawColor))
        lastPoint = newPoint
        
        // this will redraw view
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        // set width of line
        CGContextSetLineWidth(context, 5)
        CGContextSetLineCap(context, kCGLineCapRound)
        for line in lines {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
            // set color of line
            CGContextSetStrokeColorWithColor(context, line.color.CGColor)
            CGContextStrokePath(context)
        }
    }
}
