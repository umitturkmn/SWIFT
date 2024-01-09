//
//  FeedViewController.swift
//  InstagramClone
//
//  Created by Ümit Türkmen on 8.01.2024.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    
    

    @IBOutlet weak var tableView: UITableView!
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIdArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light

        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFireStore()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.commentLabel.text = userCommentArray[indexPath.row]
        cell.userImageView.sd_setImage(with: URL(string: userImageArray[indexPath.row]))
        cell.documentIdLabel.text = documentIdArray[indexPath.row]
        
        return cell
    }
    
    func getDataFromFireStore(){
        let fireStoreDatabase = Firestore.firestore()
        fireStoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Error")
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userCommentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.documentIdArray.removeAll(keepingCapacity: false)
                    for document in snapshot!.documents {
                        let documentId = document.documentID
                        self.documentIdArray.append(documentId)
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        if let postComment = document.get("postComment") as? String {
                            self.userCommentArray.append(postComment)
                        }
                        if let likes = document.get("likes") as? Int {
                            self.likeArray.append(likes)
                        }
                        if let image = document.get("imageUrl") as? String {
                            self.userImageArray.append(image)
                        }
                        
                    }
                    self.tableView.reloadData()
                }
                
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    func makeAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
    }
    

}
