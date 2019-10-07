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
    let hoursWorked = 0
    var stateTax = 0
    let grossPay = 0
    let netPay = 0
    let moveToSavings = 0
    
    
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
    
    func CalculateGrossPay() {
        
    }
    
    func CalculateNetPay() {
        
    }
    
    func CalculateSavingsTransfer() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        HideCalculatedLabels()
    }


}

