//
//  ViewController.swift
//  TipCalculator-Swift
//
//  Created by Ian Tsai on 2015-06-29.
//  Copyright (c) 2015 Ian Tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var totalTextField: UITextField!
    @IBOutlet var taxPctSlider: UISlider!
    @IBOutlet var taxPctLabel: UILabel!
    @IBOutlet var resultsTaxView: UITextView!
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        refreshUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI() {
        
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        
        resultsTaxView.text = " "
        
    }
    
    @IBAction func calculateTapped(sender: AnyObject){
        
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        let possibleTips = tipCalc.returnPossibleTips()
        var result = " "
        
        for (tipPct, tipValue) in possibleTips {
            result += "\(tipPct)%: \(tipValue)\n"
        }
        
        resultsTaxView.text = result
    }
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
        
    }
    
    @IBAction func viewTapped(sender: AnyObject){
        
        totalTextField.resignFirstResponder()
        
    }


}

