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
    private var tipTotalPercent: Double = 0.20
    private var freddNumber: Int = 31
    private var tipTotal: Double = 0.00
    
    //Toggle boolean values
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
    //end toggle
    
    //set bill total
    func setBill(bill : Double){
        billTotal = bill
    }
    
    // get fredd number
    func calculateFreddNumber() -> Int {
        return freddNumber
    }
    // get tip total
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
        
        tipTotal = Double.roundToDecimalPlace(tipTotalPercent * billTotal, numberOfDecimalPlaces: 2)
        
        return tipTotal
    }
    
    func upTip() ->(){
        
        if tipTotalPercent < 0.35{
            tipTotalPercent = floor(tipTotalPercent * pow(10.0, 2.0))
            tipTotalPercent += 1
            tipTotalPercent /= pow(10.0, 2.0)
            tipTotal = Double.roundToDecimalPlace(tipTotalPercent * billTotal, numberOfDecimalPlaces: 2)
        }
    }
    
    func downTip() ->(){
        if tipTotalPercent > 0.01{
            var beforeDecimal : Int = Int(tipTotalPercent * 100)
            var intValue : Int = Int(tipTotalPercent * 100000) % 1000
            if(intValue == 999){
                tipTotalPercent = ceil(tipTotalPercent * pow(10.0, 2.0)) / pow(10.0, 2.0)
            }
            if(intValue > 0 && intValue != 999){
                tipTotalPercent = floor(tipTotalPercent * pow(10.0, 2.0)) / pow(10.0, 2.0)
            }else{
                tipTotalPercent -= 0.01
            }
            tipTotal = Double.roundToDecimalPlace(tipTotalPercent * billTotal, numberOfDecimalPlaces: 2)
        }
    }
    
    func calculateTotal() -> (Double, Double){
        return (tipTotal, tipTotal + billTotal)
    }
    
    func roundUp() -> (tip : Double, newBill : Double, oldBill : Double){
        if billTotal > 0
        {
            var roundedBillTotal : Double = ceil(tipTotal + billTotal)
            var roundedTipTotal : Double = roundedBillTotal - billTotal
            tipTotalPercent = roundedTipTotal/billTotal
            return (roundedTipTotal, roundedBillTotal, billTotal)
        }
        return (0.0, 0.0, 0.0)
    }
}
