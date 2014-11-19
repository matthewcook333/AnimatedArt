//
//  ViewController.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/6/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate
{

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var drawView: DrawView!
    var animationViewController: AnimationViewController!
    
    @IBOutlet weak var createPathButton: UIButton!
    @IBOutlet weak var rotateClockwiseButton: UIButton!
    

    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var animationField: UITextField!

    @IBOutlet var animationPicker: UIPickerView! = UIPickerView()
    
    let animationTypes = ["Rotate","Move","Oscillate","Fade","Expand"]
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        rotateClockwiseButton.addTarget(drawView, action: "rotateClockwise:", forControlEvents: UIControlEvents.TouchUpInside)
        
        createPathButton.addTarget(drawView, action: "triggerPathCreation:", forControlEvents: UIControlEvents.TouchUpInside)
        
        doneButton.addTarget(drawView, action: "doneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        animationPicker.hidden = true
        animationPicker.delegate = self
        
        
//        animationLabel = UILabel(frame: CGRectMake(screenSize.width-250, 30, 50, 50))
//        animationLabel.text = "Animation: "
//        animationLabel.sizeToFit()
//        containerView.addSubview(animationLabel)
//        
//        animationField = UITextField(frame: CGRectMake(screenSize.width-150, 10, 170, 50))
        animationField.delegate = self
//        animationField.text = "Pick..."
//        containerView.addSubview(animationField)
//        
//        animationViewController = AnimationViewController()
//
//        // set the size of the animation menu
//        animationViewController.view.frame = CGRectMake(screenSize.width-250, 65, 250, screenSize.height-65)
//        self.addChildViewController(animationViewController)
//        
//        containerView.addSubview(animationViewController.view)
    }
    

    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return animationTypes.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return animationTypes[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        animationField.text = animationTypes[row]
        // show a view depending on what animation type user chose
        if animationField.text == "Rotate" {
        }
        else {
        }
        animationPicker.hidden = true;
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        animationPicker.hidden = false
        return false
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

