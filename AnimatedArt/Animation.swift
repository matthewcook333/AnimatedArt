//
//  Animation.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/14/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import Foundation


protocol Animation {
    var speed : Int
    
    func run()
}

class Dog : Animal {
    func run() {}
}