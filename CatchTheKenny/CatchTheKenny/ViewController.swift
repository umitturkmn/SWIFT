//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Ümit Türkmen on 11.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    var highScore = 0
    var score = 0
    var mainTimer = Timer()
    var counter = 0
    var kennyArray = [UIImageView]()
    var hideTimer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Skor: \(score)"
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "En yüksek Skor: \(highScore)"
        }
        if let newScore = storedHighScore as? Int{
            highScore = newScore
            highScoreLabel.text = "En yüksek Skor: \(highScore)"
        }
        counter = 30
        mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(incrosseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(incrosseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(incrosseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(incrosseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(incrosseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(incrosseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(incrosseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(incrosseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(incrosseScore))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        kennyArray = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9]
        
        hideKenny()
    }
    @objc func hideKenny() {
        for i in kennyArray {
            i.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
        
        
        
    }

    @objc func incrosseScore(){
        score += 1
        scoreLabel.text = "Skor: \(score)"
        
    }
    @objc func timerFunc(){
        timeLabel.text = "Kalan Süre: \(counter)"
        counter -= 1
        if counter == 0 {
            for i in kennyArray {
                i.isHidden = false
            }
            mainTimer.invalidate()
            hideTimer.invalidate()
            if self.score > self.highScore {
                highScore = score
                highScoreLabel.text = "En yüksek puanınız: \(highScore)"
                UserDefaults.standard.set(highScore, forKey: "highscore")
            }
            
            
            timeLabel.text = "Süre Bitti."
            let alert = UIAlertController(title: "Süre Bitti.", message: "Süre Bitmiştir. Skorunuz: \(score) Tekrar Denemek İster Misiniz?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
            let continueButton = UIAlertAction(title: "Tekrar Dene", style: UIAlertAction.Style.default) {
                (UIAlertAction) in
                //replat func
                self.score = 0
                self.scoreLabel.text = "Skor: \(self.score)"
                self.counter = 30
                self.timeLabel.text = "Kalan Süre: \(self.counter)"
                self.mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
            }
            alert.addAction(okButton)
            alert.addAction(continueButton)
            self.present(alert, animated: true, completion: nil)
            
        }
    }

}

