//
//  ViewController.swift
//  InstagramClone
//
//  Created by Ümit Türkmen on 8.01.2024.
//
import Firebase
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
                view.addGestureRecognizer(gestureRecognizer)
        
        

        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Hata")
                } else {
                    self.performSegue(withIdentifier: "toFeedViewcontroller", sender: nil)
                }
            }
        } else {
            self.makeAlert(title: "Eksik Giriş.", message: "Email veya Şifreyi Eksik Girdiniz.")
        }
    }
    @IBAction func signUpClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Hata")
                } else {
                    self.performSegue(withIdentifier: "toFeedViewcontroller", sender: nil)
                }
            }
        } else {
            self.makeAlert(title: "Eksik Giriş.", message: "Email veya Şifreyi Eksik Girdiniz.")
        }
        
    }
    func makeAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
    }
    @objc func hideKeyboard(){
            view.endEditing(true)
        }

    
}

