//
//  Animatable.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/14/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class Animatable: CALayer {
    
    init(imageNamed name: String!) {
        super.init()
        self.contents = UIImage(named: name)?.CGImage
        self.position = CGPoint(x: 100, y: 150)
        self.bounds = CGRectMake(100, 150, 150, 150)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
