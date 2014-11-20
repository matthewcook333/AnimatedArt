//
//  AnimationViewController.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/18/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {


    @IBOutlet var animationView: AnimationView!
    
    override func viewDidLoad() {
    
    }

    
    func changeView(animationType: String) {

//        switch animationType {
//            case "Rotate":
//                self.view.addSubview(RotateView(frame: self.view.frame))
////            case "Path":
////                self.view = pathView
////            case "Scale":
////                self.view = scaleView
//            default:
//                print("DOING IT")
//                var thing = UIView()
//                thing.backgroundColor = UIColor.greenColor()
//                self.view = thing
//            //self.view = UIView()
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
