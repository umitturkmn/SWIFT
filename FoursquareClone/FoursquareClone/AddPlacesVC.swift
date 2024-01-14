//
//  AddPlacesVC.swift
//  FoursquareClone
//
//  Created by Ümit Türkmen on 14.01.2024.
//

import UIKit

class AddPlacesVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var placesAtmText: UITextField!
    @IBOutlet weak var placesTypeText: UITextField!
    @IBOutlet weak var placesNamesText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)

        imageView.isUserInteractionEnabled = true
        let imageRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(imageRecognizer)
    }
    
    @objc func chooseImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true,completion: nil)
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        
        
        if placesNamesText.text != "" && placesAtmText.text != "" && placesTypeText.text != "" {
            if let choosenImage = imageView.image{
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = placesNamesText.text!
                placeModel.placeAtm = placesAtmText.text!
                placeModel.placeType = placesTypeText.text!
                placeModel.placeImg = choosenImage
                performSegue(withIdentifier: "toMapVC", sender: nil)
            }
        } else {
            makeAlert(title: "Eksik Giriş", message: "Eksik yerleri doldurunuz...")
        }
        
        
        
    }
    func makeAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
}
