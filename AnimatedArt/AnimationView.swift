//
//  AnimationView.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/18/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class AnimationView: UIView {
    

    @IBOutlet weak var directionButton: UISegmentedControl!
    
    @IBOutlet weak var drawPathButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        directionButton = UISegmentedControl(items: ["None", "CW", "CCW"])
//        directionButton.frame = CGRectMake(10, 30, 180, 30)
//
//        
//        self.addSubview(directionButton)
//        

    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //self.directionButton.addTarget(self, action: "createRotation:", forControlEvents: UIControlEvents.ValueChanged)
        
        print("made view")
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "resetView:", name: "done", object: nil)
        
        backgroundColor = UIColor.orangeColor()
        
        
    }
    
    func resetView(notification: NSNotification) {
        directionButton.selectedSegmentIndex = 0
    }
    
    
    @IBAction func createRotation(sender: UISegmentedControl!)
    {
        if sender.selectedSegmentIndex == 1 {
            let animation:CAAnimation = rotationAnimation(true, speed: 30)
            NSNotificationCenter.defaultCenter().postNotificationName("rotate", object: nil, userInfo: ["animation":animation])
        } else if sender.selectedSegmentIndex == 2 {
            let animation:CAAnimation = rotationAnimation(false, speed: 30)
            NSNotificationCenter.defaultCenter().postNotificationName("rotate", object: nil, userInfo: ["animation":animation])
        }
        else {
            NSNotificationCenter.defaultCenter().postNotificationName("rotate", object: nil, userInfo: [:])
            
        }
    }

    var imgAngle: Double = 0;
    func rotationAnimation(clockwise: Bool, speed: Int) -> CAAnimation
    {
        var animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = CFTimeInterval(speed)
        animation.additive = true;
        animation.removedOnCompletion = false;
        animation.repeatCount = Float.infinity
        animation.fillMode = kCAFillModeForwards;
        animation.fromValue = NSNumber(double:( imgAngle ) / 180.0 * M_PI )
        if clockwise {
            animation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) + 90)
        } else {
            animation.toValue = NSNumber(double: (( imgAngle ) / 180.0 * M_PI) - 90)
        }
        //self.layer.addAnimation(animation, forKey: "90rotation")
        
        imgAngle+=90;
        if (imgAngle>360) {
            imgAngle = 0;
        }
        
        return animation
    }
    
    @IBAction func triggerPathCreation(sender: UIButton) {
        sender.selected = !sender.selected;
        // turn on path creation if selected, otherwise turn off
        NSNotificationCenter.defaultCenter().postNotificationName("triggerPath", object: nil, userInfo: [:])

    }

    
    
}
