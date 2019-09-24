//
//  ViewController.swift
//  labelApp
//
//  Created by Kobie Nikka on 9/19/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var launchText: UILabel!
    var pressCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchText.text = "Button has been pressed 0 times"
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        pressCount += 1
        launchText.text = "Button has been pressed \(pressCount) times"
    }
    
}

