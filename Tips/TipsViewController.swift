//
//  TipsViewController.swift
//  Tips
//
//  Created by Strat Aguilar on 6/10/15.
//  Copyright (c) 2015 Strat Aguilar. All rights reserved.
//

import UIKit
import iAd

class TipsViewController: UIViewController, ADBannerViewDelegate, UITextFieldDelegate {
    
    var fredd = FredCalculator()
    let checkBoxImage = UIImage(named: "check_box_blue") as UIImage?
    let emptyBoxImage = UIImage(named: "empty_box_blue") as UIImage?
    @IBOutlet weak var checkAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var freddNumberLabel: UILabel!
    @IBOutlet weak var friendlyButtonOutlet: UIButton!
    @IBOutlet weak var checkupButtonOutlet: UIButton!
    @IBOutlet weak var exactOrderButtonOutlet: UIButton!
    @IBOutlet weak var desiredTempButtonOutlet: UIButton!
    @IBOutlet weak var drinkRefillButtonOutlet: UIButton!
    @IBOutlet weak var adBanner: ADBannerView!
    @IBOutlet weak var tipPercentageLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adBanner.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        checkAmountTextField.resignFirstResponder()
        fredd.calculateTip()
        return false
    }
    
    @IBAction func friendlyButton(sender: UIButton) {
        buttonTogglePress(friendlyButtonOutlet)
        fredd.toggleFriendly()
        update()
    }
    
    @IBAction func checkupButton(sender: UIButton) {
        buttonTogglePress(checkupButtonOutlet)
        fredd.toggleRegularCheck()
        update()
    }
    
    @IBAction func exactOrderButton(sender: UIButton) {
        buttonTogglePress(exactOrderButtonOutlet)
        fredd.toggleExactOrder()
        update()
    }
    
    @IBAction func desiredTempButton(sender: UIButton) {
        buttonTogglePress(desiredTempButtonOutlet)
        fredd.toggleDesiredTemp()
        update()
    }

    @IBAction func drinkRefillButton(sender: UIButton) {
        buttonTogglePress(drinkRefillButtonOutlet)
        fredd.toggleDrinkRefill()
        update()
    }
    
    @IBAction func roundupButton(sender: UIButton) {
        var tip : Double = 0
        var total : Double = 0
        var oldTotal : Double = 0
        (tip, total, oldTotal) = fredd.roundUp()
        totalAmountLabel.text = NSString(format: "%.2f", total) as String
        tipAmountLabel.text = NSString(format: "%.2f", tip) as String
        if oldTotal > 0 {
            tipPercentageLable.text = NSString(format: "%.2f%%", tip / oldTotal * 100) as String
        }
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text.rangeOfString(".") == nil && (textField.text as NSString).doubleValue > 999.99 && string.toInt() != nil {
         return false
        }
        
        if textField.text == "" && string.toInt() == 0{
            return false
        }
        
        if textField.text.rangeOfString(".") != nil {
            if string == "." {
                return false
            }
            var stringArray = [String]()
            stringArray = textField.text.componentsSeparatedByString(".")
            
            if count(stringArray[1]) > 1 && string.toInt() != nil {
                return false
            }
            
        }
        
        return true
        
    }
    
    func endEditing(){
        self.view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        let keyboardDonebuttonView = UIToolbar()
        keyboardDonebuttonView.sizeToFit()
        
        let item = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("endEditing"))
        var toolbarButtons = [item]
        keyboardDonebuttonView.setItems(toolbarButtons, animated: false)
        textField.inputAccessoryView = keyboardDonebuttonView
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        update()
    }
    
    func buttonTogglePress(button: UIButton){
        if button.titleLabel?.text == "✔︎" {
            button.setTitle("✘", forState: UIControlState.Normal)
            button.setImage(emptyBoxImage, forState: UIControlState.Normal)
        }else{
            button.setTitle("✔︎", forState: UIControlState.Normal)
            button.setImage(checkBoxImage, forState: UIControlState.Normal)
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func update(){
        var tip : Double = 0
        var total : Double = 0
        fredd.setBill((checkAmountTextField.text as NSString).doubleValue)
        fredd.calculateTip()
        (tip, total) = fredd.calculateTotal()
        
        var tipPercent : Double = fredd.getTipTotal() * 100
        freddNumberLabel.text = fredd.calculateFreddNumber().description
        totalAmountLabel.text = NSString(format: "%.2f", total) as String
        tipAmountLabel.text = NSString(format: "%.2f", tip) as String
        tipPercentageLable.text = NSString(format: "%.2f%%", tipPercent) as String
    }
    
    
    @IBAction func incrementTip(sender: UIButton) {
        var tip : Double = 0
        var total : Double = 0
        fredd.setBill((checkAmountTextField.text as NSString).doubleValue)
        fredd.upTip()
        (tip, total) = fredd.calculateTotal()
        
        var tipPercent : Double = fredd.getTipTotal() * 100
        freddNumberLabel.text = fredd.calculateFreddNumber().description
        totalAmountLabel.text = NSString(format: "%.2f", total) as String
        tipAmountLabel.text = NSString(format: "%.2f", tip) as String
        tipPercentageLable.text = NSString(format: "%.2f%%", tipPercent) as String
        
        
    }
    
    
    @IBAction func decrementTip(sender: UIButton) {
        var tip : Double = 0
        var total : Double = 0
        fredd.setBill((checkAmountTextField.text as NSString).doubleValue)
        fredd.downTip()
        (tip, total) = fredd.calculateTotal()
        
        var tipPercent : Double = fredd.getTipTotal() * 100
        freddNumberLabel.text = fredd.calculateFreddNumber().description
        totalAmountLabel.text = NSString(format: "%.2f", total) as String
        tipAmountLabel.text = NSString(format: "%.2f", tip) as String
        tipPercentageLable.text = NSString(format: "%.2f%%", tipPercent) as String
        
    }
    
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        println("Banner failed to recieve ad with error \(error) -- end ")
        if !banner.hidden
        {
            banner.hidden = true
        }
        
    }

}
