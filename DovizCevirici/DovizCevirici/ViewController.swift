//
//  ViewController.swift
//  DovizCevirici
//
//  Created by Ümit Türkmen on 6.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ukpLabel: UILabel!
    @IBOutlet weak var kvdLabel: UILabel!
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        // 1) Request & Session
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=d1fe8e9151a3cd104d0b0eec1e13d8d2")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "Bağlantı Koptu", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                // 2) Response & Data
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                        //ASYNC
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String:Any]{
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "ABD Doları: \(usd)"
                                }
                                if let trl = rates["TRY"] as? Double {
                                    self.tryLabel.text = "Türk Lirası: \(trl)"
                                }
                                if let eur = rates["EUR"] as? Double {
                                    self.euroLabel.text = "EURO: \(eur)"
                                }
                                if let kwd = rates["KWD"] as? Double {
                                    self.kvdLabel.text = "Kuveyt Dinarı: \(kwd)"
                                }
                                if let pound = rates["GBP"] as? Double {
                                    self.ukpLabel.text = "Pound: \(pound)"
                                }
                            }
                        }
                    } catch {
                        print("error")
                    }
                    
                }
            }
        }
        task.resume()
        
        
        
        
    }
    
}

