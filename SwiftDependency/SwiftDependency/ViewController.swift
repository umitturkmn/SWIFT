//
//  ViewController.swift
//  SwiftDependency
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import UIKit
import Swinject

class ViewController: UIViewController {
    
    let container : Container = {
        let container = Container()
        container.register(BGProvadingClass.self) { resolver in
            return BGProvadingClass()
        }
        container.register(AnothoerViewController.self) { resolver in
            let vc = AnothoerViewController(providerProtocol: resolver.resolve(BGProvadingClass.self))
            return vc
        }
        return container
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBlue
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.setTitle("Başka Bir Diyar", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }

    @objc private func buttonClicked(){
        if let viewController = container.resolve(AnothoerViewController.self) {
            present(viewController,animated: true)
        }
    }
}

