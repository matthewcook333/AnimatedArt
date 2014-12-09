//
//  Animatable.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/14/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class Animatable: CAShapeLayer {
    
    override init!() {
        super.init()
        self.strokeColor = UIColor.redColor().CGColor
        self.fillColor = UIColor.clearColor().CGColor
        self.lineWidth = 2.0;
    }
    
    override init(layer: AnyObject!) {
        super.init(layer: layer)
        self.strokeColor = UIColor.redColor().CGColor
        self.fillColor = UIColor.clearColor().CGColor
        self.lineWidth = 2.0;
    }
    

    
    // init with an image
    init(imageNamed name: String!) {
        super.init()
        self.contents = UIImage(named: name)?.CGImage
        self.position = CGPoint(x: 100, y: 150)
        self.bounds = CGRectMake(100, 150, 150, 150)
    }
    
    init(image name: UIImageView!) {
        super.init()
    
//        self.contents = picture.image
//        self.bounds = picture.bounds
//        self.position = CGPoint(x: 100, y: 150)
        self.contents = name.image?.CGImage
        self.bounds = name.bounds

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
