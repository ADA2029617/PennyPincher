//
//  ViewController.swift
//  PennyPincher
//
//  Created by Adan Partida on 10/7/19.
//  Copyright © 2019 Adan Partida. All rights reserved.
//
// TODO:
// Handle nil from textfields
// Add label and textfield for shift differential hours
// Store previous net pay value as token for later use
// Add decision statements to compare current and previous
// net pays and change UIView background accordingly

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //----------Attributes--------//
    let hourlyWage = 11.25
    let shiftDiffWage = 11.50
    var shiftDiffTotal = 0.0
    var hoursWorked = 0.0
    var stateTax = 0.0
    var amountTaxed = 0.0
    var grossPay = 0.0
    var netPay = 0.0
    var moveToSavings = 0.0
    var audioPlayer: AVAudioPlayer!
    
    
    //-----------Outlets----------//
    @IBOutlet weak var HoursTextField: UITextField!
    @IBOutlet weak var StateTaxTextField: UITextField!
    @IBOutlet weak var ShiftDiffHoursTextField: UITextField!
    @IBOutlet weak var CalculateButtonOutlet: UIButton!
    @IBOutlet weak var GrossPayLabel: UILabel!
    @IBOutlet weak var GrossLabel: UILabel!
    @IBOutlet weak var NetPayLabel: UILabel!
    @IBOutlet weak var NetLabel: UILabel!
    @IBOutlet weak var MoveToSavingsLabel: UILabel!
    @IBOutlet weak var SavingsLabel: UILabel!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    
    
    
    //-----------Actions----------//
    @IBAction func CalculateButtonAction(_ sender: UIButton) {
        
        audioPlayer.play()
        
        if HoursTextField.text?.isEmpty ?? true || StateTaxTextField.text?.isEmpty ?? true || ShiftDiffHoursTextField.text?.isEmpty ?? true {
            ErrorLabel.text = "Please fill all text fields."
            ErrorLabel.isHidden = false
        }
        
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
        ErrorLabel.isHidden = true
        GrossLabel.isHidden = true
        NetPayLabel.isHidden = true
        NetLabel.isHidden = true
        MoveToSavingsLabel.isHidden = true
        SavingsLabel.isHidden = true
    }
    
    func CalculateGrossPay(/*_ workHours: Double */) -> Double {
        
        
        hoursWorked = Double(HoursTextField.text!)!
        stateTax = (Double(StateTaxTextField.text!)!) / 100
        shiftDiffTotal = shiftDiffWage * Double(ShiftDiffHoursTextField.text!)!
        grossPay = (hourlyWage * hoursWorked)
        grossPay += shiftDiffTotal
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
    
    @IBAction func doneTyping(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        HideCalculatedLabels()
        
        let Sound = URL(fileURLWithPath: Bundle.main.path(forResource: "Cash Register", ofType: "mp3")!)
        //let sound = Bundle.main.path(forResource: "Cash Register", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: Sound)
        }
        catch {
            print(error)
        }
    }


}

