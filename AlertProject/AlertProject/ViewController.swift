//
//  ViewController.swift
//  AlertProject
//
//  Created by Ümit Türkmen on 8.12.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText2: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButton(_ sender: Any) {
        
        if usernameText.text == "" || passwordText.text == "" || passwordText2.text == "" {
            let alert = UIAlertController(title: "Eksik Giriş.", message: "Kullanıcı adı veya şifre eksik girildi.", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            }    else {
                if passwordText.text != passwordText2.text {
                    let alert = UIAlertController(title: "Eksik Giriş.", message: "Parolalar eşleşmedi.", preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
                    else if passwordText.text == passwordText2.text {
                    let alert = UIAlertController(title: "Başarılı Giriş", message: "Giriş Yapıldı Yönlendiriliyorsunuz.", preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
        }
        
        
        
        
    }
    
}

