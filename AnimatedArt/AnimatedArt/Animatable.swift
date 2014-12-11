//
//  Animatable.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/14/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class Animatable: CAShapeLayer {
    
    // contains all of the paths and the corresponding properties
    var drawnImage = Dictionary<UIBezierPath, (UIColor)>()
    
    override init!() {
        super.init()
        // initialize path and make shape fill clear
        self.path = CGPathCreateMutable()
        self.fillColor = UIColor.clearColor().CGColor
    }
    
    // specify that init with layer exists
    override init(layer: AnyObject!) {
        super.init(layer: layer)
    }
    

    
    // init with an image
    init(imageNamed name: String!) {
        super.init()
        self.contents = UIImage(named: name)?.CGImage
        self.position = CGPoint(x: 100, y: 150)
        self.bounds = CGRectMake(100, 150, 150, 150)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func display() {
        super.display()

        self.sublayers = nil
        var combinedPath :CGMutablePathRef = CGPathCreateMutableCopy(path);
        for (path, (color)) in drawnImage {
            var sublayer = CAShapeLayer()
            sublayer.strokeColor = color.CGColor
            sublayer.fillColor = UIColor.clearColor().CGColor
            sublayer.lineWidth = 2.0
            sublayer.lineCap = kCALineCapRound
            sublayer.path = path.CGPath
            self.addSublayer(sublayer)
            CGPathAddPath(combinedPath, nil, path.CGPath);
        }
        self.path = combinedPath
    }
}
