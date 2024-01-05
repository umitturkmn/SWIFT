//
//  ViewController.swift
//  HesapMakinesi
//
//  Created by Ümit Türkmen on 5.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FirstText: UITextField!
    @IBOutlet weak var SecondText: UITextField!
    @IBOutlet weak var Result: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func Sum(_ sender: Any) {
       
        if let firstNumber = Int(FirstText.text!) {
            if let secondNumber = Int(SecondText.text!) {
                let result = firstNumber + secondNumber
                Result.text = String(result)
            } else {
                Result.text = "Hatalı Giriş."
            }
        } else {
            Result.text = "Hatalı Giriş"
        }
    }
    @IBAction func Minus(_ sender: Any) {
        if let firstNumber = Int(FirstText.text!) {
            if let secondNumber = Int(SecondText.text!) {
                let result = firstNumber - secondNumber
                Result.text = String(result)
            } else {
                Result.text = "Hatalı Giriş."
            }
        } else {
            Result.text = "Hatalı Giriş"
        }
    }
    @IBAction func Multiply(_ sender: Any) {
        if let firstNumber = Int(FirstText.text!) {
            if let secondNumber = Int(SecondText.text!) {
                let result = firstNumber * secondNumber
                Result.text = String(result)
            } else {
                Result.text = "Hatalı Giriş."
            }
        } else {
            Result.text = "Hatalı Giriş"
        }
    }
    @IBAction func Divide(_ sender: Any) {
        if let firstNumber = Int(FirstText.text!) {
            if let secondNumber = Int(SecondText.text!) {
                let result = firstNumber / secondNumber
                Result.text = String(result)
            } else {
                Result.text = "Hatalı Giriş."
            }
        } else {
            Result.text = "Hatalı Giriş"
        }
    }
    
}

