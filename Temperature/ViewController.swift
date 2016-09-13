//
//  ViewController.swift
//  Temperature
//
//  Created by Ricky Bloomfield on 8/26/16.
//  Copyright © 2016 Ricky Bloomfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var tempTextField: UITextField!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    // Method to convert the temperature from Fahrenheit to Celsius
    @IBAction func convert(_ sender: AnyObject) {
        // Convert the entered value if it is not nil
        if let tempF = Double(tempTextField.text!) {
            let tempC = (tempF-32)*(5/9)
            tempLabel.text = String(tempC)
            
            if tempF > 100 {
                descriptionLabel.text = "Better Hydrate!"
                descriptionLabel.textColor = UIColor.red
            } else if tempF < 32 {
                descriptionLabel.text = "Brr! Pack the Long Johns!"
                descriptionLabel.textColor = UIColor.blue
            } else {
                descriptionLabel.text = "That's a reasonable temperature!"
                descriptionLabel.textColor = UIColor.black
            }
        }
        
        // If value is nil, reset the UI
        else if tempTextField.text?.characters.count == 0 {
            reset(sender)
        }
        
        // If value is not a valid number, reset the UI and display an alert to inform the user
        else {
            reset(sender)
            let alertController = UIAlertController(title: "Not a Valid Number", message: "Please enter a valid number.", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion:nil)
        }
    }
    
    // Convevience method to call the "convert" method each time the UITextField text changes
    @IBAction func textChanged(_ sender: AnyObject) {
        convert(sender)
    }
    
    // Method to reset the interface to the default state
    @IBAction func reset(_ sender: AnyObject) {
        tempTextField.text = nil
        tempLabel.text = nil
        descriptionLabel.text = "Please enter a temperature above"
        descriptionLabel.textColor = UIColor.black
    }
}

