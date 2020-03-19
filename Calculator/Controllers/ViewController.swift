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
    
    //MARK: - Properties
    
    //By using private the variable is only accesible inside this class 
    private var isFinishedTypingNum: Bool = true
    
    //Computed property with getter and setter
    private var displayValue: Double{
        //when we try to get the value of the display
        get{
            guard let number = Double(displayLabel.text!) else {
                return 0
            }
            return number
        }
        //when we try to set a value to the display
        set{
           displayLabel.text =  String(newValue)
        }
    }
    
    //initilize an instance of the struct CalculatorLogic
    private var calculatorLogic = CalculatorLogic()
    
    //MARK: - IBActions
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        //This will stop appending numbers to start clear
        isFinishedTypingNum = true
        
        calculatorLogic.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle  {
            
            if let result = calculatorLogic.calculate(symbol: calcMethod)  {
               displayValue = result
            } 
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        guard let numValue = sender.currentTitle else { return }
        
        
        if isFinishedTypingNum {
            
            displayLabel.text = numValue
            //print("done typing \(numValue)")
            isFinishedTypingNum = false
            //if use is not done typing
        }else{
      
            //Prevent user from typing more than one .
            if numValue == "."{
                //check if the rounded value is = to the current value
 
                //if is equal then is an int and we can allow user to type .
                let isInt = floor(displayValue) == displayValue
                
                //else if is not equal means tha user already ente a decimal
                //so we must prevent user from entering additional ..
                if !isInt{
                    //return to prevent appending none value
                    return
                }
                
            }
            //this will append the current value to the new value
            displayLabel.text = displayLabel.text! + numValue
        }
        
    }

}

