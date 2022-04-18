//
//  DetailsViewController.swift
//  ios exercise
//
//  Created by user220264 on 4/16/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: LazyImageView!
    @IBOutlet weak var describeLbl: UILabel!
    
    var titleTxt = ""
    var describe = ""
    var imageURL = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = titleTxt
        describeLbl.text = describe
        if !imageURL.isEmpty , let url = URL(string: imageURL)  {
            imageView.loadImage(from: url)
            imageView.isHidden = false
        }
        else{
            imageView.isHidden = true
        }

    }
    

}
