//
//  CalculationLogic.swift
//  Calculator
//
//  Created by Filip on 14/12/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation


struct CalculationLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        
        self.number = number
        
    }
    
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            
            if symbol == "+/-" {
                
                return n * -1
                
            } else if symbol == "%" {
                
                return n / 100
                
            } else if symbol == "AC" {
                
                return 0
                
            } else if symbol == "=" {
                
                return performTwoNumCalculation(n2: n)
                
            } else {
                
                intermediateCalculation = (n1: n, operation: symbol)
                
            }
            
           
        }
        
         return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1 , let operation = intermediateCalculation?.operation {
            
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
                fatalError()
            }
            
        }
        return nil
    }
    
}
