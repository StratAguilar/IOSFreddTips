//
//  FredNumberViewController.swift
//  Tips
//
//  Created by Strat Aguilar on 6/19/15.
//  Copyright (c) 2015 Strat Aguilar. All rights reserved.
//

import UIKit

class FredNumberViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
   
    @IBOutlet var collectionOfLabels: [UILabel]!

    var freddNumbers = [Int](0...31).reverse()
    var numberSelected : Int = 0
    let friendlyString :String = "Friendly Service!"
    let regularString : String = "Regular Checkups on Customers"
    let exactString : String = "Exact Orders Received"
    let desiredTempString : String = "Desired Temperature of Food"
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
        var i : Int = 0

        if numberSelected > 15 {
            collectionOfLabels[i].text = refillString
            i = i + 1
            numberSelected %= 16
            eekBool = false
        }
        if numberSelected > 7 {
            collectionOfLabels[i].text = desiredTempString
            i = i + 1
            numberSelected %= 8
            eekBool = false
        }
        if numberSelected > 3 {
            collectionOfLabels[i].text = exactString
            i = i + 1
            numberSelected %= 4
            eekBool = false
        }
        if numberSelected > 1 {
            collectionOfLabels[i].text = regularString
            i = i + 1
            numberSelected %= 2
            eekBool = false
        }
        if numberSelected > 0 {
            collectionOfLabels[i].text = friendlyString
            i = i + 1
            eekBool = false
        }
        if eekBool {
            collectionOfLabels[i].text = eekString
            i = i + 1
        }
        
        while i < collectionOfLabels.count {
            collectionOfLabels[i].text = ""
            i = i + 1
        }
    }
    
    
}
