//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Ümit Türkmen on 22.12.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var landMarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImages = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landMarkNames.append("istanbul")
        landMarkNames.append("ordu")
        landMarkNames.append("girit")
        landMarkNames.append("roma")
        landMarkNames.append("new york")
        
        
        landmarkImages.append(UIImage(named: "istanbul")!)
        landmarkImages.append(UIImage(named: "ordu")!)
        landmarkImages.append(UIImage(named: "girit")!)
        landmarkImages.append(UIImage(named: "roma")!)
        landmarkImages.append(UIImage(named: "newyork")!)
        
        landMarkNames[0]
        landmarkImages[0]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        
        
        return landMarkNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration()
        content.text = landMarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landMarkNames[indexPath.row]
        chosenLandmarkImages = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImages
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landMarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

