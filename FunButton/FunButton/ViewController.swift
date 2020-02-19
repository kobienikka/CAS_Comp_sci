//
//  ViewController.swift
//  FunButton
//
//  Created by Kobie Nikka on 2/11/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonOne: NamedButton!
    @IBOutlet weak var buttonTwo: NamedButton!
    @IBOutlet weak var buttonThree: NamedButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonTwo.name = "Dancing Button"
        buttonThree.name = "Fat Button"
    }

    @IBAction func buttonPress(_ sender: Any) {
        let message: String
        if let sender = sender as? NamedButton {
            message = "Hello my name is \(sender.name)"
 `       } else {
            message = "Hello, I don't know who I am"
        }
        let alert = UIAlertController(title: "Hi", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

