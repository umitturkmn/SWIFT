//
//  ViewController.swift
//  Ottomans
//
//  Created by Ümit Türkmen on 22.12.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    
    @IBOutlet weak var tableView: UITableView!
    var chosenSultan : Ottomans?
    
    
    var ottomansArray = [Ottomans]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let fatih = Ottomans(name: "Fatih Sultan Mehmet", about: "II. Mehmed veya bilinen adıyla Fatih Sultan Mehmed ya da kısaca Fatih, Osmanlı İmparatorluğu'nun 7. padişahıdır. İlk olarak 1444–1446 yılları arasında kısa bir dönem, daha sonra 1451'den 1481 yılındaki ölümüne kadar 30 yıl boyunca hüküm sürdü.", image: UIImage(named: "fsultanmehmet")!)
        
        let suleyman = Ottomans(name: "Kanuni Sultan Süleyman", about: "I. Süleyman, Osmanlı İmparatorluğu'nun onuncu padişahı ve 89. İslam halifesidir. Batı'da Muhteşem Süleyman, Doğu'da ise adaletli yönetimine atfen Kanûnî Sultan Süleyman olarak da bilinmektedir. ", image: UIImage(named: "suleyman")!)
        
        let murat = Ottomans(name: "4. Murat", about: "IV. Murad, dîvân edebiyatındaki mahlası Murâdî, 17. Osmanlı padişahı ve 96. İslam halifesi. 1623 ile 1640 yılları arasında hüküm sürdü. Revan ve Bağdat fatihidir. IV. Murad İstanbul'da, Sultan I. Ahmed'in ve Kösem Sultan'ın oğlu olarak dünyaya geldi.", image: UIImage(named: "4murat")!)
        
        let abdulhamit = Ottomans(name: "II. Abdulhamit Han", about: "II. Abdülhamid, Osmanlı İmparatorluğu'nun 34. padişahı, 113. İslam halifesi ve çöküş sürecindeki devlette mutlak hakimiyet sağlayan son padişahtır. ", image: UIImage(named: "abdulhamit")!)
        
        let yavuz = Ottomans(name: "Yavuz Sultan Süleyman", about: "I. Selim veya bilinen adıyla Yavuz Sultan Selim, Osmanlı İmparatorluğu'nun 9. padişahı ve 88. İslam hâlifesidir. Hâdimü'l–Haremeyni'ş–Şerîfeyn unvanına ve divan edebiyatındaki Selîmî mahlasına sahiptir. ", image: UIImage(named: "ysultanselim")!)
        
        let mahmut = Ottomans(name: "II. Mahmut", about: "II. Mahmud, 30. Osmanlı padişahı ve 109. İslam halifesidir. Osman Gazi ve Sultan İbrahim'den sonra Osmanlı Hanedanı'nın üçüncü ve son soy atasıdır. Son altı Osmanlı padişahından ikisi onun oğlu dördü ise torunudur. Tahtta kaldığı 31 yıl, Osmanlı tarihinin siyasi açıdan en bunalımlı dönemlerinden biridir.", image: UIImage(named: "mahmudii")!)
        
        ottomansArray = [fatih,suleyman,murat,abdulhamit,yavuz,mahmut]
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = ottomansArray[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ottomansArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSultan = ottomansArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSultan = chosenSultan
        }
    }

}

