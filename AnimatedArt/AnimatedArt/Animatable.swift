//
//  Animatable.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/14/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class Animatable: UIImageView {
    
    //var animations: [Animation] = []
    var animate = false
    
    init(imageNamed name: String!) {
        let location = CGRectMake(10, 10, 50, 50)
        super.init(frame: location)
        self.image = UIImage(named: name)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    

}
