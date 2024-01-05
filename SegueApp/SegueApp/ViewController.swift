//
//  ViewController.swift
//  SegueApp
//
//  Created by Ümit Türkmen on 8.12.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var motherPage: UILabel!
    var userName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButton(_ sender: Any) {
        userName = nameField.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            
            let destinationVC = segue.destination as! FatherViewController
            destinationVC.resultField.text = userName
        }
    }
    
}

