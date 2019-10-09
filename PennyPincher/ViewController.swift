//
//  ViewController.swift
//  PennyPincher
//
//  Created by Adan Partida on 10/7/19.
//  Copyright © 2019 Adan Partida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //----------Attributes--------//
    let hourlyWage = 11.25
    var hoursWorked = 0.0
    var stateTax = 0.0
    var amountTaxed = 0.0
    var grossPay = 0.0
    var netPay = 0.0
    var moveToSavings = 0.0
    
    
    //-----------Outlets----------//
    @IBOutlet weak var HoursTextField: UITextField!
    @IBOutlet weak var StateTaxTextField: UITextField!
    @IBOutlet weak var CalculateButtonOutlet: UIButton!
    @IBOutlet weak var GrossPayLabel: UILabel!
    @IBOutlet weak var GrossLabel: UILabel!
    @IBOutlet weak var NetPayLabel: UILabel!
    @IBOutlet weak var NetLabel: UILabel!
    @IBOutlet weak var MoveToSavingsLabel: UILabel!
    @IBOutlet weak var SavingsLabel: UILabel!
    
    
    
    
    //-----------Actions----------//
    @IBAction func CalculateButtonAction(_ sender: UIButton) {
        GrossLabel.text = "$" + String(format: "%.2f", CalculateGrossPay())
        NetLabel.text = "$" + String(format: "%.2f", CalculateNetPay())
        SavingsLabel.text = "$" + String(format: "%.2f", CalculateSavingsTransfer())
        ShowCalculatedLabels()
    }
    
    
    
    //----------Functions---------//
    func ShowCalculatedLabels() {
        GrossPayLabel.isHidden = false
        GrossLabel.isHidden = false
        NetPayLabel.isHidden = false
        NetLabel.isHidden = false
        MoveToSavingsLabel.isHidden = false
        SavingsLabel.isHidden = false
    }
    
    func HideCalculatedLabels() {
        GrossPayLabel.isHidden = true
        GrossLabel.isHidden = true
        NetPayLabel.isHidden = true
        NetLabel.isHidden = true
        MoveToSavingsLabel.isHidden = true
        SavingsLabel.isHidden = true
    }
    
    func CalculateGrossPay(/*_ workHours: Double */) -> Double {
        hoursWorked = Double(HoursTextField.text!)!
        stateTax = Double(StateTaxTextField.text!)!
        grossPay = hourlyWage * hoursWorked
        return grossPay
    }
    
    func CalculateNetPay() -> Double {
        amountTaxed = grossPay * stateTax
        netPay = grossPay - amountTaxed
        return netPay
    }
    
    func CalculateSavingsTransfer() -> Double {
        moveToSavings = netPay * 0.20
        return moveToSavings
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        HideCalculatedLabels()
    }


}

