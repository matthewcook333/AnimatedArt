//
//  AnimationViewController.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/18/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var rotateView: RotateView = RotateView(frame: CGRectMake(0, 0, 50, 50))

    override func viewDidLoad() {

        rotateView.backgroundColor = UIColor.orangeColor()
        self.view = rotateView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
