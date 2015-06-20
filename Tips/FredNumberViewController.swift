//
//  FredNumberViewController.swift
//  Tips
//
//  Created by Strat Aguilar on 6/19/15.
//  Copyright (c) 2015 Strat Aguilar. All rights reserved.
//

import UIKit

class FredNumberViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var friendlyLabel: UILabel!
    @IBOutlet weak var regularLabel: UILabel!
    @IBOutlet weak var exactLabel: UILabel!
    @IBOutlet weak var desiredTempLabel: UILabel!
    @IBOutlet weak var drinkRefillLabel: UILabel!
    @IBOutlet weak var eekLabel: UILabel!
    
    var freddNumbers = [Int](0...31).reverse()
    var numberSelected : Int = 0
    let friendlyString :String = "Friendly Service!"
    let regularString : String = "Regular Checkups on Customers"
    let exactString : String = "Exact Orders Received"
    let desiredTempString : String = "Desired Temperature of Provided"
    let refillString : String = "Drinks Refilled Promptly"
    let eekString : String = "EEK!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var fredNumberPickerView: UIPickerView!
    
    
    //MARK : - Delgates and data sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return freddNumbers.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return freddNumbers[row].description
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        numberSelected = freddNumbers[row]
        var eekBool : Bool = true
        
        if numberSelected > 15 {
            drinkRefillLabel.text = refillString
            numberSelected %= 16
            eekBool = false
        } else { drinkRefillLabel.text = "" }
        if numberSelected > 7 {
            desiredTempLabel.text = desiredTempString
            numberSelected %= 8
            eekBool = false
        } else { desiredTempLabel.text = "" }
        if numberSelected > 3 {
            exactLabel.text = exactString
            numberSelected %= 4
            eekBool = false
        } else { exactLabel.text = "" }
        if numberSelected > 1 {
            regularLabel.text = regularString
            numberSelected %= 2
            eekBool = false
        } else { regularLabel.text = "" }
        if numberSelected > 0 {
            friendlyLabel.text = friendlyString
            eekBool = false
        } else { friendlyLabel.text = ""}
        if eekBool {
            eekLabel.text = eekString
        } else { eekLabel.text = "" } 
    }
    
    
}
