//
//  TipsViewController.swift
//  Tips
//
//  Created by Strat Aguilar on 6/10/15.
//  Copyright (c) 2015 Strat Aguilar. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController {
    
    var fredd = FredCalculator()

    @IBOutlet weak var checkAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var freddNumberLabel: UILabel!
    @IBOutlet weak var friendlyButtonOutlet: UIButton!
    @IBOutlet weak var checkupButtonOutlet: UIButton!
    @IBOutlet weak var exactOrderButtonOutlet: UIButton!
    @IBOutlet weak var desiredTempButtonOutlet: UIButton!
    @IBOutlet weak var drinkRefillButtonOutlet: UIButton!
    
    @IBAction func friendlyButton(sender: UIButton) {
        buttonTogglePress(friendlyButtonOutlet)
        fredd.toggleFriendly()
        fredd.calculateTip()
    }
    
    @IBAction func checkupButton(sender: UIButton) {
        buttonTogglePress(checkupButtonOutlet)
        fredd.toggleRegularCheck()
        fredd.calculateTip()
    }
    
    @IBAction func exactOrderButton(sender: UIButton) {
        buttonTogglePress(exactOrderButtonOutlet)
        fredd.toggleExactOrder()
        fredd.calculateTip()
    }
    
    @IBAction func desiredTempButton(sender: UIButton) {
        buttonTogglePress(desiredTempButtonOutlet)
        fredd.toggleDesiredTemp()
        fredd.calculateTip()
    }

    @IBAction func drinkRefillButton(sender: UIButton) {
        buttonTogglePress(drinkRefillButtonOutlet)
        fredd.toggleDrinkRefill()
        fredd.calculateTip()
    }
    
    func buttonTogglePress(button: UIButton){
        if button.titleLabel?.text == "✔︎" {
            button.setTitle("✘", forState: UIControlState.Normal)
        }else{
            button.setTitle("✔︎", forState: UIControlState.Normal)
        }
    }
}
