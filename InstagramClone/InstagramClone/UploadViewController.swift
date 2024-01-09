//
//  UploadViewController.swift
//  InstagramClone
//
//  Created by Ümit Türkmen on 8.01.2024.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
                view.addGestureRecognizer(gestureRecognizer)
        imageView.isUserInteractionEnabled = true
        let getRecognizer = UITapGestureRecognizer(target: self, action: #selector(choseImage))
        imageView.addGestureRecognizer(getRecognizer)
        
    }
    @objc func hideKeyboard(){
            view.endEditing(true)
        }
    func makeAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
    }
    @IBAction func uploadButtonClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data,metadata: nil) { metadata, error in
            if error != nil {
                self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Error")
            } else {
                imageReference.downloadURL { (url, error) in
                    if error == nil {
                        let imageUrl = url?.absoluteString
                        
                        let firestoreDatabase = Firestore.firestore()
                        var firestoreReferance : DocumentReference? = nil
                        
                        let firestorePost = ["imageUrl" : imageUrl!, "postedBy" : Auth.auth().currentUser!.email,"postComment" : self.commentText.text!,"date" : FieldValue.serverTimestamp(), "likes" : 0] as [String : Any]
                        firestoreReferance = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { error in
                            if error != nil {
                                self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Error")
                            } else {
                                self.imageView.image = UIImage(named: "upload.jpg")
                                self.commentText.text = ""
                                self.tabBarController?.selectedIndex = 0
                            }
                        })
                    }
                }
                
            }
        }
            
        }
    }
    
    @objc func choseImage(){
        let picker = UIImagePickerController()
                picker.delegate = self
                picker.sourceType = .photoLibrary
                picker.allowsEditing = true
                present(picker, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true,completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
