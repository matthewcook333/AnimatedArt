//
//  ViewController.swift
//  AnimatedArt
//
//  Created by Matthew Cook on 11/6/14.
//  Copyright (c) 2014 Matthew Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate
{

    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var animationMenuView: AnimationMenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animationMenuView.rotateClockwiseButton.addTarget(drawView, action: "rotateClockwise:", forControlEvents: UIControlEvents.TouchUpInside)
        
        animationMenuView.createPathButton.addTarget(drawView, action: "triggerPathCreation:", forControlEvents: UIControlEvents.TouchUpInside)
        
        animationMenuView.doneButton.addTarget(drawView, action: "doneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        pickerBizCat.hidden = true;
        pickerBizCat.delegate = self
        
        textfieldBizCat.text = bizCat[0]
        textfieldBizCat.delegate = self
    }
    
    
    @IBOutlet var textfieldBizCat: UITextField!
    @IBOutlet var pickerBizCat: UIPickerView! = UIPickerView()
    
    var bizCat = ["Cat One", "Cat Two", "Cat Three"]
    
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return bizCat.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return bizCat[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        textfieldBizCat.text = bizCat[row]
        pickerBizCat.hidden = true;
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        pickerBizCat.hidden = false
        return false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

