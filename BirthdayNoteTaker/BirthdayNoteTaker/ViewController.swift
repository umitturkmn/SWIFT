//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Ümit Türkmen on 8.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var BirthdayTewtField: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storeName = UserDefaults.standard.object(forKey: "isim")
        let dateName = UserDefaults.standard.object(forKey: "dgünü")
        
        if let myName = storeName as? String{
            nameLabel.text = myName
        }
        if let myBirthday = dateName as? String{
            birthdayLabel.text = myBirthday
        }
    }

    @IBAction func deleteButton(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "isim")
        let storedbdate = UserDefaults.standard.object(forKey: "dgünü")
        
        if let newName = storedName as? String{
            UserDefaults.standard.removeObject(forKey: "isim")
            nameLabel.text = "İsim: "
        }
        if let newBDate = storedbdate as? String{
            UserDefaults.standard.removeObject(forKey: "dgünü")
            birthdayLabel.text = "Doğum Günü: "
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        UserDefaults.standard.set(nameTextField.text!, forKey: "isim")
        UserDefaults.standard.set(BirthdayTewtField.text!, forKey: "dgünü")
        
        nameLabel.text = "İsim: \(nameTextField.text!)"
        birthdayLabel.text = "Doğum Günü: \(BirthdayTewtField.text!)"
    }
}

