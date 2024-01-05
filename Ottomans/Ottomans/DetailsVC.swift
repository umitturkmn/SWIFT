//
//  DetailsVC.swift
//  Ottomans
//
//  Created by Ümit Türkmen on 22.12.2023.
//

import UIKit

class DetailsVC: UIViewController{

    @IBOutlet weak var sultansName: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var aboutLabel: UITextView!
    
    var selectedSultan : Ottomans?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sultansName.text = selectedSultan?.name
        imageView.image = selectedSultan?.image
        aboutLabel.text = selectedSultan?.about
        
    }
    

    

}
