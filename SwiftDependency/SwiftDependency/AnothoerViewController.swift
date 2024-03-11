//
//  AnothoerViewController.swift
//  SwiftDependency
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import UIKit

class AnothoerViewController: UIViewController {
    
    private let providerProtocol : BGColorProtocol?
    
    init(providerProtocol: BGColorProtocol?) {
        self.providerProtocol = providerProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = providerProtocol?.backgroundColor ?? .white
        // Do any additional setup after loading the view.
    }
    

  

}
