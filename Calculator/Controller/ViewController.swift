//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018. Modified by Filip G on 12/12/2018
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var calcButs: UIStackView!
    
    private var isFinishedTypingNumber: Bool = true
    
    
    private var displayValue: Double {
        
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can't convert to double")
            }
            return number
        }
        set {
            
            displayLabel.text = String(newValue)
            
            
        }
    }
    
    private var calculator = CalculationLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) { 
                
                displayValue = result
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                if numValue == "." {
                    displayLabel.text = "0."
                    isFinishedTypingNumber = false
                } else {
                    displayLabel.text = numValue
                    isFinishedTypingNumber = false
                }
                
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                    
                }
                displayLabel.text = displayLabel.text! + numValue
                
            }
            
        }
        
    }
    
}

