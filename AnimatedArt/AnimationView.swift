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
    @IBOutlet weak var clearPathButton: UIButton!
    
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
        
        // if 0, means user removed rotation, otherwise notify addition of rotation
        if sender.selectedSegmentIndex == 0 {
            NSNotificationCenter.defaultCenter().postNotificationName("rotate", object: nil, userInfo: [:])
        } else {
            NSNotificationCenter.defaultCenter().postNotificationName("rotate", object: nil, userInfo: ["clockwise":sender.selectedSegmentIndex, "speed":rotateSpeed])
        }
    }
    
    @IBAction func triggerPathSpeedChange(sender: UISlider) {
        let pathSpeed = Int(pathSpeedSlider.maximumValue - pathSpeedSlider.value + pathSpeedSlider.minimumValue)
        NSNotificationCenter.defaultCenter().postNotificationName("triggerPath", object: nil, userInfo: ["speed":pathSpeed])
    }
    
    @IBAction func triggerPathCreation(sender: UIButton) {
        let pathSpeed = Int(pathSpeedSlider.maximumValue - pathSpeedSlider.value + pathSpeedSlider.minimumValue)
        
        // turn on path creation if selected, otherwise turn off
        sender.selected = !sender.selected;
        
        NSNotificationCenter.defaultCenter().postNotificationName("triggerPath", object: nil, userInfo: ["speed":pathSpeed, "buttonTrigger":1])

    }

    
    @IBAction func clearPath(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("clearPath", object: nil, userInfo: [:])
    }
    
}
