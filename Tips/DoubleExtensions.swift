//
//  DoubleExtensions.swift
//  Tips
//
//  Created by Strat Aguilar on 6/16/15.
//  Copyright (c) 2015 Strat Aguilar. All rights reserved.
//

import Foundation

extension Double {
     static func roundToDecimalPlace(decimalValue : Double, numberOfDecimalPlaces : Double) -> Double {
        var value : Double = decimalValue
        if value != 0 {
            var placement : Double = pow( 10.0, numberOfDecimalPlaces)
            value = placement * decimalValue
            value = round(value)
            value = value / placement
        }
        
        return value
    }
}