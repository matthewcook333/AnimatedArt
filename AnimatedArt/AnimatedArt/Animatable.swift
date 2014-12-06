//
//  Animatable.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/14/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class Animatable: CALayer {
    
    // init with an image
    init(imageNamed name: String!) {
        super.init()
        //self.contents = UIImage(named: name)?.CGImage
        //self.position = CGPoint(x: 100, y: 150)
        //self.bounds = CGRectMake(100, 150, 150, 150)
    }
    
    init(image name: UIImageView!) {
        super.init()
    
//        self.contents = picture.image
//        self.bounds = picture.bounds
//        self.position = CGPoint(x: 100, y: 150)
        self.contents = name.image?.CGImage
        self.bounds = name.bounds

    }
    
    var path: CGPath!
    
    // init with a given drawn path
    init(drawingPath: CGPath) {
        super.init()
        self.path = drawingPath
        self.contents = UIImageView(frame: super.frame)
        self.bounds = self.contents.bounds
        self.position = self.contents.position
//        var drawing: CAShapeLayer = CAShapeLayer()
//        drawing.path = drawingPath;
//        drawing.strokeColor = UIColor.blackColor().CGColor
//        drawing.fillColor = UIColor.clearColor().CGColor
//        drawing.lineWidth = 2.0;
//        self.addSublayer(drawing)
        //UIGraphicsBeginImageContext(self.bounds.size);
        // draw your path here
        //var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        //UIGraphicsEndImageContext()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func display() {
        super.display()
        if self.contents == nil {
            println("wattt")
        } else if self.contents.bounds == nil {
            println("teehehe")
        }
        //self.bounds = self.contents.bounds
        //self.position = self.contents.position
    }
    
//    func drawAnimatable() {
//        UIGraphicsBeginImageContext(self.bounds.size);
//        // draw your path here
//        var imagePath: CAShapeLayer = CAShapeLayer()
//        imagePath.path = path
//        imagePath.strokeColor = UIColor.redColor().CGColor
//        imagePath.fillColor = UIColor.clearColor().CGColor
//        imagePath.lineWidth = 2.0;
//        //self.addSublayer(imagePath)
//        self.contents = imagePath
//
//        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//    }

}
