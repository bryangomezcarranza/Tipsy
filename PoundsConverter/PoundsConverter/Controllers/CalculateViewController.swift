//
//  CalculateViewController.swift
//  PoundsConverter
//
//  Created by Bryan Gomez on 8/16/21.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var bilTotalTextField: UITextField!
    @IBOutlet weak var billTaxTextField: UITextField!
    @IBOutlet weak var costumeTipTextField: UITextField!
    
    @IBOutlet weak var tipAmountTotal: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    
    @IBOutlet weak var tenPercentTipe: UIButton!
    @IBOutlet weak var fifteenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    
    var tipValue = 0.10
    var billTotal = 0.0
    var taxTotal = 0.7
    var tipAmount = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // TIP
    @IBAction func tipChanged(_ sender: UIButton) {
        
        let buttonTitle = sender.currentTitle!
        let buttonWithOutPercent = String(buttonTitle.dropLast())
        let tipNumber = Double(buttonWithOutPercent)
        
        guard let tipNumber = tipNumber else { return }
        tipValue = tipNumber / 100
        
    }
    //Calculate
    @IBAction func calculatePressed(_ sender: Any) {
        guard let bill = bilTotalTextField.text, !bill.isEmpty else { return }
        let tax = billTaxTextField.text!
        
        if bill != "" || tax != "" {
            
            billTotal = Double(bill)!
            taxTotal = Double(tax) ?? 0.0
            
            let tip = (1 + tipValue)
            let tax = (taxTotal / 100) + 1
            
            
            let result = (billTotal * tax) * tip
            
            let resultWithNoDecimalPlace = String(format: "%.2f", result)
            totalAmount.text = "$" + resultWithNoDecimalPlace
            
            let tipTotal = billTotal * (tip - 1)
            let tipWith2Decimals = String(format: "%.2f", tipTotal)
            tipAmountTotal.text = "$" + String(tipWith2Decimals)
            
            print(resultWithNoDecimalPlace)
            
        }
    }
    
}
