//
//  ViewController.swift
//  GestureApp
//
//  Created by Ümit Türkmen on 8.12.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageLabel: UIImageView!
    var isOttoman1 = true
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageLabel.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        imageLabel.addGestureRecognizer(gestureRecognizer)
        
        
            
    }

    @objc func changePic(){
        
        
        if isOttoman1 == true{
            imageLabel.image = UIImage(named: "ottoman2")
            nameLabel.text = "Osmanlılar(2)"
            isOttoman1 = false
        } else {
            imageLabel.image = UIImage(named: "ottoman5")
            nameLabel.text = "Osmanlılar(5)"
            isOttoman1 = true
        }
        
    }
}

