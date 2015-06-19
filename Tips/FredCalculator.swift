//
//  FredCalculator.swift
//  Tips
//
//  Created by Strat Aguilar on 6/11/15.
//  Copyright (c) 2015 Strat Aguilar. All rights reserved.
//

import Foundation

class FredCalculator{
    
    private var tipBase: Double = 0.15
    private var largeCrement: Double = 0.02
    private var mediumCrement: Double = 0.0075
    private var smallCrement: Double = 0.005
    private var terribleService: Double = 0.05
    private var badService: Double = 0.08
    private var friendly: Bool = true
    private var regularCheck: Bool = true
    private var exactOrder: Bool = true
    private var desiredTemp: Bool = true
    private var drinkRefill: Bool = true
    private var billTotal: Double = 0.0
    private var tipTotalPercent: Double = 0.15
    private var freddNumber: Int = 0
    private var tipTotal: Double = 0.00
    
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
    
    func setBill(bill : Double){
        billTotal = bill
    }
    
    func calculateFreddNumber() -> Int {
        return freddNumber
    }
    func getTipTotal() -> Double {
        return tipTotalPercent
    }
    func calculateTip() -> Double{
        tipTotalPercent = tipBase
        freddNumber = 0
        var terrible : Bool = true
        
        if friendly {
            tipTotalPercent += largeCrement
            freddNumber += Int(pow(2.0, 0.0))
            terrible = false
        }else{
            tipTotalPercent -= mediumCrement
            
        }
        if regularCheck {
            tipTotalPercent += mediumCrement
            freddNumber += Int(pow(2.0, 1.0))
            terrible = false
        }else{
            tipTotalPercent -= smallCrement
        }
        if exactOrder {
            tipTotalPercent += mediumCrement
            freddNumber += Int(pow(2.0, 2.0))
            terrible = false
        }else{
            tipTotalPercent -= smallCrement
        }
        if desiredTemp {
            tipTotalPercent += mediumCrement
            freddNumber += Int(pow(2.0, 3.0))
            if terrible{
                tipTotalPercent = badService
            }
            terrible = false
        }else{
            tipTotalPercent -= smallCrement
        }
        if drinkRefill {
            tipTotalPercent += mediumCrement
            freddNumber += Int(pow(2.0, 4.0))
            if terrible{
                tipTotalPercent = badService
            }
            terrible = false
        }else{
            tipTotalPercent -= smallCrement
        }
        if terrible {
            tipTotalPercent = terribleService
        }
        
        tipTotal = tipTotalPercent * billTotal
        tipTotal = Double.roundToDecimalPlace(tipTotal, numberOfDecimalPlaces: 2)
        
        return tipTotal
    }
    
    func calculateTotal() -> (Double, Double){
        return (tipTotal, tipTotal + billTotal)
    }
    
    func roundUp() -> (tip : Double, bill : Double){
        if billTotal > 0
        {
            var roundedBillTotal : Double = ceil(tipTotal + billTotal)
            var roundedTipTotal : Double = roundedBillTotal - billTotal
            return (roundedTipTotal, roundedBillTotal)
        }
        return (0.0, 0.0)
    }
}
