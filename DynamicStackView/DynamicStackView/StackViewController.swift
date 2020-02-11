//
//  StackViewController.swift
//  DynamicStackView
//
//  Created by Kobie Nikka on 2/6/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {
    
    var labelCount = 5
    let nameList = ["JayJay", "Matthew", "Miles", "Stone", "Skyler", "Kobie", "Riley"]
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let labels = (1...labelCount).map({ (x) -> UILabel in
            let newLabel = UILabel()
//            newLabel.text = "hi buddy\(x)"
            return newLabel
        })
        for (x, label) in labels.enumerated() {
            label.text = "Hello \(nameList[x % nameList.count])"
            label.textAlignment = NSTextAlignment.center
            stackView.addArrangedSubview(label)
            let constraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: labels[0], attribute: .height, multiplier: 1, constant: 0)
            if label != labels[0] {
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
