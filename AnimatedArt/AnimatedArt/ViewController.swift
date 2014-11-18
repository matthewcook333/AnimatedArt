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
        
        rotateClockwiseButton.addTarget(drawView, action: "rotateClockwise:", forControlEvents: UIControlEvents.TouchUpInside)
        
        createPathButton.addTarget(drawView, action: "triggerPathCreation:", forControlEvents: UIControlEvents.TouchUpInside)
        
        doneButton.addTarget(drawView, action: "doneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
//        // temp image
//        if let tempImage = UIImage(named: "sample.jpg") {
//            drawView.currentAnimatable.image = tempImage
//        }
    }
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

