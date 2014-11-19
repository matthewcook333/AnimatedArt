//
//  RotateView.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/18/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class RotateView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.orangeColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
