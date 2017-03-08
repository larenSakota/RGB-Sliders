//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Laren Sakota on 3/7/17.
//  Copyright © 2017 3..2..1..GO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var redValue: UITextField!
    @IBOutlet weak var greenValue: UITextField!
    @IBOutlet weak var blueValue: UITextField!
    @IBOutlet weak var hexValue: UITextField!
    

    @IBAction func updateBackgroundColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        viewColor.backgroundColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        
        redValue.text = "\(Int(red))"
        greenValue.text = "\(Int(green))"
        blueValue.text = "\(Int(blue))"
        
//        redSlider.value = Float(redValue.text!)!
//        greenSlider.value = Float(greenValue.text!)!
//        blueSlider.value = Float(blueValue.text!)!
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.borderColor = UIColor.black.cgColor
        viewColor.layer.borderWidth = 1
        updateBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

