//
//  AnimationViewController.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/18/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var pathView: PathView!// =  RotateView(frame: self.view.frame)
    var scaleView: ScaleView!// =  RotateView(frame: self.view.frame)

    @IBOutlet weak var rotateView: RotateView!
    
    override func viewDidLoad() {
//        rotateView = RotateView(frame: self.view.frame)
//        pathView = PathView(frame: self.view.frame)
//        scaleView = ScaleView(frame: self.view.frame)
        
        rotateView.clockwiseButton.addTarget(rotateView, action: "rotateClockwise:", forControlEvents: UIControlEvents.TouchUpInside)

    }
    
    func changeView(animationType: String) {
        switch animationType {
            case "Rotate":
                self.view = rotateView
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
