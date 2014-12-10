//
//  ViewController.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/6/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var drawView: DrawView!
    var animationViewController: AnimationViewController!
    
    @IBOutlet weak var doneButton: UIButton!
    

    @IBOutlet var animationPicker: UIPickerView! = UIPickerView()
    
    let animationTypes = ["Rotate","Path","Oscillate","Fade","Scale"]
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    @IBOutlet weak var colorNumberLabel: UILabel!
    @IBOutlet weak var colorButton: UIButton!
    
    var colorArray: [UIButton] = []

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animationViewController = AnimationViewController()
        
        doneButton.addTarget(drawView, action: "doneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        view.backgroundColor = UIColor.blackColor()
        var buttonFrame = CGRect(x: 725, y: 12.5, width: 25, height: 25)
        var i:CGFloat = 1.0
        while i > 0 {
            makeRainbowButtons(buttonFrame, sat: i ,bright: 1.0)
            i = i - 0.1
            buttonFrame.origin.y = buttonFrame.origin.y + buttonFrame.size.height
        }
    }
    
    @IBAction func showColorPicker(sender: AnyObject) {
        for button in colorArray {
            button.hidden = false
        }
    }
    
    func makeRainbowButtons(buttonFrame:CGRect, sat:CGFloat, bright:CGFloat){
        var myButtonFrame = buttonFrame
        //populate an array of buttons
        for i in 0..<12{
            let hue:CGFloat = CGFloat(i) / 12.0
            let color = UIColor(hue: hue, saturation: sat, brightness: bright, alpha: 1.0)
            let aButton = UIButton(frame: myButtonFrame)
            myButtonFrame.origin.x = myButtonFrame.size.width + myButtonFrame.origin.x
            aButton.backgroundColor = color
            view.addSubview(aButton)
            aButton.addTarget(self, action: "displayColor:", forControlEvents: UIControlEvents.TouchUpInside)
            
            aButton.hidden = true
            colorArray.append(aButton)
            
        }
    }
    
    func displayColor(sender:UIButton){
        var r:CGFloat = 0,g:CGFloat = 0,b:CGFloat = 0
        var a:CGFloat = 0
        var h:CGFloat = 0,s:CGFloat = 0,l:CGFloat = 0
        let color = sender.backgroundColor!
        if color.getHue(&h, saturation: &s, brightness: &l, alpha: &a){
            if color.getRed(&r, green: &g, blue: &b, alpha: &a){
                let colorText = NSString(format: "HSB: %4.2f,%4.2f,%4.2f RGB: %4.2f,%4.2f,%4.2f",
                    Float(h),Float(s),Float(b),Float(r),Float(g),Float(b))
                colorNumberLabel.text = colorText
                drawView.drawColor = color
            }
        }
        
        colorButton.setTitleColor(color, forState: UIControlState.Normal)
        // hide buttons after selection
        for button in colorArray {
            button.hidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

