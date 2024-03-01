//
//  ViewController.swift
//  SnapchatClone
//
//  Created by Ümit Türkmen on 1.03.2024.
//

import UIKit
import Firebase

class SigningVC: UIViewController {

    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
                        view.addGestureRecognizer(gestureRecognizer)

        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        if passwordLabel.text != "" && emailLabel.text != "" {
            Auth.auth().signIn(withEmail: emailLabel.text!, password: passwordLabel.text!) { auth, error in
                if error != nil {
                    self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            makeAlert(title: "Eksik Giriş", message: "Eksik kalan yerleri doldurunuz...")
        }
    }
    @IBAction func signUpClicked(_ sender: Any) {
        if usernameLabel.text != "" && passwordLabel.text != "" && emailLabel.text != "" {
            
            Auth.auth().createUser(withEmail: emailLabel.text!, password: passwordLabel.text!) { auth, error in
                if error != nil {
                    self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Error")
                } else {
                    
                    let fireStore = Firestore.firestore()
                    let userDictionary = ["email" : self.emailLabel.text!,"usernname": self.usernameLabel.text!] as [String : Any]
                    fireStore.collection("UserInfo").addDocument(data: userDictionary) { error in
                        if error != nil {
                            self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Error")
                        }
                    }
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        } else {
            makeAlert(title: "Eksik Giriş", message: "Eksik kalan yerleri doldurunuz...")
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

