//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Ümit Türkmen on 9.01.2024.
//
import Firebase
import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var documentIdLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userEmailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        documentIdLabel.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func likeButtonClicked(_ sender: Any) {
        let fireStoreDatabes = Firestore.firestore()
        if let likeCount = Int(likeLabel.text!) {
            
            let likeStore = ["likes" : likeCount + 1] as [String : Any]
            
            
            fireStoreDatabes.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
        }
        
        
        
    }
    
}
