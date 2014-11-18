//
//  AnimationMenuView.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/17/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class AnimationMenuView: UIView{
    
    @IBOutlet weak var createPathButton: UIButton!
    @IBOutlet weak var rotateClockwiseButton: UIButton!
    
    @IBOutlet weak var doneButton: UIButton!
    
    let pickerData = ["Rotate","Move","Oscillate","Fade","Expand","Sharp Cheddar","Monterrey Jack","Stilton","Gouda","Goat Cheese", "Asiago"]
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // init code here
    
        // temporary background color
        backgroundColor = UIColor.orangeColor()
        
    }
    


    
}
