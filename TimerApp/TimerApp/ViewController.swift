//
//  ViewController.swift
//  TimerApp
//
//  Created by Ümit Türkmen on 8.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 10
        timeLabel.text = "Zaman: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerFunction() {
        timeLabel.text = "Zaman: \(counter)"
        counter -= 1
        if counter == 0 {
            timer.invalidate()
            timeLabel.text = "Zaman Bitti."
        }
    }

    @IBAction func startButton(_ sender: Any) {
    }
    
}

