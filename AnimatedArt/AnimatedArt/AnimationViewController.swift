//
//  AnimationViewController.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/18/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var pathView: PathView!
    var scaleView: ScaleView!

    @IBOutlet weak var rotateView: RotateView!
    
    override func viewDidLoad() {
        
        rotateView.hidden = true

        rotateView.directionButton.addTarget(rotateView, action: "createRotation:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func changeView(animationType: String) {
        switch animationType {
            case "Rotate":
                rotateView.hidden = false
//            case "Path":
//                self.view = pathView
//            case "Scale":
//                self.view = scaleView
            default:
                self.view = UIView()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
