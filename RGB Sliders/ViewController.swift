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
    
    @IBAction func changeTextField() {
            redSlider.value = Float(redValue.text!)!
            greenSlider.value = Float(greenValue.text!)!
            blueSlider.value = Float(blueValue.text!)!
    }

    @IBAction func updateBackgroundColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        viewColor.backgroundColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        
        redValue.text = "\(Int(red))"
        greenValue.text = "\(Int(green))"
        blueValue.text = "\(Int(blue))"

        
        let defaults = UserDefaults.standard
        defaults.set(redSlider.value, forKey: "red")
        defaults.set(greenSlider.value, forKey: "green")
        defaults.set(blueSlider.value, forKey: "blue")
        defaults.synchronize()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        redSlider.value = defaults.float(forKey: "red")
        greenSlider.value = defaults.float(forKey: "green")
        blueSlider.value = defaults.float(forKey: "blue")
        
        viewColor.layer.borderColor = UIColor.black.cgColor
        viewColor.layer.borderWidth = 1
        updateBackgroundColor()
        changeTextField()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "openColor") {
            let newViewController = segue.destination
            newViewController.view.backgroundColor = viewColor.backgroundColor
        }
    }


}

