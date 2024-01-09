//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Ümit Türkmen on 8.01.2024.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    var userEmailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        
    }
    
    

    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        } catch {
            print("Error")
        }
        
    }
    
}
