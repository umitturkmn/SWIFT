//
//  FatherViewController.swift
//  SegueApp
//
//  Created by Ümit Türkmen on 8.12.2023.
//

import UIKit

class FatherViewController: UIViewController {
    @IBOutlet weak var fatherLabel: UILabel!
    var myName = ""
    @IBOutlet weak var resultField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultField.text = myName
    
    }
    

   
}
