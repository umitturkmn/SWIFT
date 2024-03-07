//
//  ViewController.swift
//  ThreadingProject
//
//  Created by Ümit Türkmen on 7.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var tracker = 0
    let urlStrings = ["https://img.freepik.com/free-photo/majestic-mountain-peak-tranquil-winter-landscape-generated-by-ai_188544-15662.jpg?w=1800&t=st=1709823371~exp=1709823971~hmac=e384fe19e6e1ba87c1a01f86c57177d5fbeb5309a3352091b7d78b17c042142c","https://image-1.uhdpaper.com/wallpaper/pokemon-ball-house-anime-digital-art-4k-wallpaper-uhdpaper.com-68@1@o.jpg","https://image-0.uhdpaper.com/wallpaper/cat-colorful-digital-art-4k-wallpaper-uhdpaper.com-103@0@i.jpg","https://image5.uhdpaper.com/wallpaper/ellie-the-last-of-us-part-2-battle-uhdpaper.com-4K-5.2477.jpg"]
    var data = Data()
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        tableView.dataSource = self
        tableView.delegate = self
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data)
            }
            
        }
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.compose, target: self, action: #selector(changeImage))
    }
    
    @objc func changeImage(){
        
        if tracker == 0 {
            tracker += 1
        } else {
            tracker -= 1
        }
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data)
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Test Test"
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
}

