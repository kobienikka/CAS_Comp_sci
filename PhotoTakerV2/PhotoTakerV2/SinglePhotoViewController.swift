//
//  SinglePhotoViewController.swift
//  PhotoTaker
//
//  Created by Kobie Nikka on 2/28/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import UIKit

class SinglePhotoViewController: UIViewController {

    var image: UIImage?
    var whichPhoto: Int?
    var captionsList: [String] = []
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var captionInput: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        if captionsList.count >= whichPhoto! {
//            captionLabel.text = captionsList[whichPhoto! - 1]
//        }
        imageView.image = image
    }
    
    @IBAction func saveCaption(_ sender: Any) {
        var caption = captionInput.text
        captionsList.append(caption!)
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
