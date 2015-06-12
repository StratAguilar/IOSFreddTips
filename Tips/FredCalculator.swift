//
//  FredCalculator.swift
//  Tips
//
//  Created by Strat Aguilar on 6/11/15.
//  Copyright (c) 2015 Strat Aguilar. All rights reserved.
//

import Foundation

class FredCalculator{
    
    static private var tipBase: Double = 0.15
    private var largeCrement: Double = 0.02
    private var mediumCrement: Double = 0.0075
    private var smallCrement: Double = 0.005
    
    private var friendly: Bool = true
    private var regularCheck: Bool = true
    private var exactOrder: Bool = true
    private var desiredTemp: Bool = true
    private var drinkRefill: Bool = true
    private var billTotal: Double = 0.0
    private var tipTotal: Double = tipBase
    private var fredNumber: Int = 0
    
    func toggleFriendly(){
        friendly = !friendly
    }
    func toggleRegularCheck(){
        regularCheck = !regularCheck
    }
    func toggleExactOrder(){
        exactOrder = !exactOrder
    }
    
    func toggleDesiredTemp(){
        desiredTemp = !desiredTemp
    }

    func toggleDrinkRefill(){
        drinkRefill = !drinkRefill
    }
    
    func calculateTip(){
        tipTotal = 0.15
        
        if friendly {
            tipTotal += largeCrement
            fredNumber += Int(pow(2.0, 0.0))
        }else{
            tipTotal -= mediumCrement
        }
        if regularCheck {
            tipTotal += mediumCrement
            fredNumber += Int(pow(2.0, 1.0))
        }else{
            tipTotal -= smallCrement
        }
        if exactOrder {
            tipTotal += mediumCrement
            fredNumber += Int(pow(2.0, 2.0))
        }else{
            tipTotal -= smallCrement
        }
        if desiredTemp {
            tipTotal += mediumCrement
            fredNumber += Int(pow(2.0, 3.0))
        }else{
            tipTotal -= smallCrement
        }
        if drinkRefill {
            tipTotal += mediumCrement
            fredNumber += Int(pow(2.0, 4.0))
        }else{
            tipTotal -= smallCrement
        }
        println(tipTotal)
    }
}