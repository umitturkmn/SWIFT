//
//  DetailVC.swift
//  NiceThingApp
//
//  Created by Ümit Türkmen on 23.12.2023.
//

import UIKit
import CoreData

class DetailVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    var chosenThings = ""
    var chosenThingsId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenThings != "" {
            saveButton.isHidden = true
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = chosenThingsId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for i in results as! [NSManagedObject] {
                        if let name = i.value(forKey: "name") as? String {
                            nameText.text = name
                        }
                        if let artist = i.value(forKey: "artist") as? String {
                            artistText.text = artist
                        }
                        if let year = i.value(forKey: "year") as? Int {
                            yearText.text = String(year)
                        }
                        if let imageData = i.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                }
            } catch{
                print("error")
            }
        } else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
        }
        
        
        //Recognizer
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapRecognazier = UITapGestureRecognizer(target: self, action: #selector(addImage))
        imageView.addGestureRecognizer(imageTapRecognazier)
        
        
        
    }
    
    @objc func addImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        
        let newThings = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        
        newThings.setValue(artistText.text!, forKey: "artist")
        newThings.setValue(nameText.text!, forKey: "name")
        if let year = Int(yearText.text!) {
            newThings.setValue(year, forKey: "year")
        }
        newThings.setValue(artistText.text!, forKey: "artist")
        newThings.setValue(UUID(), forKey: "id")
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        newThings.setValue(data, forKey: "image")
        
        do {
            try context.save()
            
        } catch {
            let alert = UIAlertController(title: "Foto Kaydedilemedi", message: "ERROR", preferredStyle:UIAlertController.Style.alert)
                                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                                alert.addAction(okButton)
                                self.present(alert, animated: true, completion: nil)
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
        
        
        
        
        
    }
    
}
    


