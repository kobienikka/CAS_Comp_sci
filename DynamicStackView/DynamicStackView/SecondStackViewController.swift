//
//  SecondStackViewController.swift
//  DynamicStackView
//
//  Created by Kobie Nikka on 2/6/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import UIKit

class SecondStackViewController: UIViewController {
    
    var imageCount = 3
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let images = (1...imageCount).map({ (x) -> UIImageView in
                    let newImage = UIImageView()
                    return newImage
                })
        for image in images {
            image.image = UIImage(named: "babyPhoto.png")
            image.backgroundColor = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 1)
            stackView.addArrangedSubview(image)
            let constraint = NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: images[0], attribute: .height, multiplier: 1, constant: 0)
            if image != images[0] {
                stackView.addConstraint(constraint)
            }
        }
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
