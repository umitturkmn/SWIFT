//
//  ViewController.swift
//  ObjectWithCode
//
//  Created by Ümit Türkmen on 6.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let width = view.frame.size.width
        let hight = view.frame.size.height
        
        let myLabel = UILabel()
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.5 - width * 0.8 / 2, y: hight / 2, width: width * 0.8, height: 50)
        view.addSubview(myLabel)
    }


}

