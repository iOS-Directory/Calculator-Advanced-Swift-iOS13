//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    //By using private the variable is only accesible inside this class 
    private var isFinishedTypingNum: Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        //This will stop appending numbers to start clear
        isFinishedTypingNum = true
        
        //Get the current number in display
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot conver display label text to a Double.")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "AC" {
                displayLabel.text = "0"
            }else if calcMethod == "+/-" {
                
                displayLabel.text = String(format:"%.0f" , number * -1)
                
            }else if calcMethod == "%" {
                displayLabel.text = String(number / 100)
            }
            
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        guard let numValue = sender.currentTitle else { return }
        
        
        if isFinishedTypingNum {
            displayLabel.text = numValue
            isFinishedTypingNum = false
        }else{
            //this will append the current value to the new value
            displayLabel.text = displayLabel.text! + numValue
        }
        
        
        
        
    }

}

