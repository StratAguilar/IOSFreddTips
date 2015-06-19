//
//  FredNumberViewController.swift
//  Tips
//
//  Created by Strat Aguilar on 6/19/15.
//  Copyright (c) 2015 Strat Aguilar. All rights reserved.
//

import UIKit

class FredNumberViewController: UIViewController {

    @IBOutlet weak var friendlyLabel: UILabel!
    @IBOutlet weak var refillLabel: UILabel!
    @IBOutlet weak var exactLabel: UILabel!
    @IBOutlet weak var desiredTempLabel: UILabel!
    @IBOutlet weak var drinkRefillLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var fredNumberPickerView: UIPickerView!

}
