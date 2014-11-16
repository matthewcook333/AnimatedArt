//
//  ViewController.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/6/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var createPathButton: UIButton!
    @IBOutlet weak var rotateClockwiseButton: UIButton!
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        rotateClockwiseButton.addTarget(self, action: "rotateClockwise:", forControlEvents: UIControlEvents.TouchUpInside)
        
        createPathButton.addTarget(drawView, action: "triggerPathCreation:", forControlEvents: UIControlEvents.TouchUpInside)
        
        doneButton.addTarget(drawView, action: "doneButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        
//        // temp image
//        if let tempImage = UIImage(named: "sample.jpg") {
//            drawView.currentAnimatable.image = tempImage
//        }
    }
    

    func rotateClockwise(sender:UIButton!)
    {
        let duration = 2.0
        let delay = 0.0
        let options = UIViewKeyframeAnimationOptions.CalculationModePaced
        
        // angles in iOS are measured as radians PI is 180 degrees so PI × 2 is 360 degrees
        let fullRotation = CGFloat(M_PI * 2)
        
        UIView.animateKeyframesWithDuration(duration, delay: delay, options: options, animations: {
            
            // note that we've set relativeStartTime and relativeDuration to zero.
            // Because we're using `CalculationModePaced` these values are ignored
            // and iOS figures out values that are needed to create a smooth constant transition
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                self.drawView.currentAnimatable.transform = CGAffineTransformMakeRotation(1/3 * fullRotation)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                self.drawView.currentAnimatable.transform = CGAffineTransformMakeRotation(2/3 * fullRotation)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                self.drawView.currentAnimatable.transform = CGAffineTransformMakeRotation(3/3 * fullRotation)
            })
            
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

