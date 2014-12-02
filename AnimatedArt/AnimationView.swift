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
    @IBOutlet weak var rotationSpeedSlider: UISlider!
    
    @IBOutlet weak var drawPathButton: UIButton!
    @IBOutlet weak var pathSpeedSlider: UISlider!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "resetView:", name: "done", object: nil)
        
    }
    
    func resetView(notification: NSNotification) {
        directionButton.selectedSegmentIndex = 0
        
        // if user has not unselected button, unselect and animate now
        if drawPathButton.selected {
            triggerPathCreation(drawPathButton)
        }
    }
    
    @IBAction func changeRotationSpeed(sender: AnyObject) {
        createRotation(directionButton)
    }
    
    @IBAction func createRotation(sender: UISegmentedControl!)
    {
        let rotateSpeed = Int(rotationSpeedSlider.maximumValue - rotationSpeedSlider.value + rotationSpeedSlider.minimumValue)
        println(rotateSpeed)
        
        if sender.selectedSegmentIndex == 1 {
            let animation:CAAnimation = rotationAnimation(true, speed: rotateSpeed)
            NSNotificationCenter.defaultCenter().postNotificationName("rotate", object: nil, userInfo: ["animation":animation])
        } else if sender.selectedSegmentIndex == 2 {
            let animation:CAAnimation = rotationAnimation(false, speed: rotateSpeed)
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
    
    @IBAction func triggerPathSpeedChange(sender: UISlider) {
        
    }
    
    @IBAction func triggerPathCreation(sender: UIButton) {
        sender.selected = !sender.selected;
        // turn on path creation if selected, otherwise turn off
        NSNotificationCenter.defaultCenter().postNotificationName("triggerPath", object: nil, userInfo: [:])

    }

    
    
}
