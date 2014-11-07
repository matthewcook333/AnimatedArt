//
//  Line.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/6/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class Line {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    
    init(start _start: CGPoint, end _end: CGPoint, color _color: UIColor) {
        start = _start
        end = _end
        color = _color
    }
}
