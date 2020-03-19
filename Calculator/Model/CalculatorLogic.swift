//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by FGT MAC on 3/19/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    //MARK: - Properties
    private var number: Double?
    
    private var intermidiateCalculation: (n1: Double, calcMethod: String)?
    
    
    //MARK: - Methods
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCal(n2: n)
            default:
                intermidiateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCal(n2: Double) -> Double? {
        
        if let n1 = intermidiateCalculation?.n1,
            let operation = intermidiateCalculation?.calcMethod{
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed id does not match any of the cases")
            }
        }
        return nil
    }
}
