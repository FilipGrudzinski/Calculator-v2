//
//  CalculationLogic.swift
//  Calculator
//
//  Created by Filip on 14/12/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation


class CalculationLogic {
    
    var number: Double
    
    init(number:Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        
        if symbol == "+/-" {
            
            return number * -1
            
        } else if symbol == "%" {
            
            return number / 100
            
        } else if symbol == "AC" {
            
            return 0
            
        }
        return nil
        
    }
    
    
        
    
        
    
    
    
}
