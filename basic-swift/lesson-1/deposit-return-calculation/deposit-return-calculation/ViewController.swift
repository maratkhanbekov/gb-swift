//
//  ViewController.swift
//  deposit-return-calculation
//
//  Created by Marat on 27.06.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var percentage: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var calculate: UIButton!
    
    var amountNumber: Float = 0.0
    var percentageNumber: Float = 0.0
    
    override func viewDidLoad() {
        calculate.titleLabel?.adjustsFontSizeToFitWidth = true
        calculate.layer.cornerRadius = 20
        super.viewDidLoad()
    }


    @IBAction func calculation(_ sender: UIButton) {
        
        if let amountInput = amount.text {
            amountNumber = Float(amountInput) ?? 0.0
        }
        else {
            output.text = "Введите первоначальную сумму вклада"
        }
        
        if let percentageInput = percentage.text {
            percentageNumber = Float(percentageInput) ?? 0.0
        }
        else {
            output.text = "Введите годовой процент на вклад"
        }
        
        if amountNumber > 0 {
            let finalAmount = String(amountNumber * pow((1+percentageNumber/100), 5))
            output.text = "Через 5 лет на счету будет \(finalAmount)"
        }
        
        else {
            output.text = "Введите параметры"
        }
        
        
    }
}

