//
//  ViewController.swift
//  AppRememberer
//
//  Created by Kobie Nikka on 1/7/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var nameEntry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let existingName: String? = try? String(contentsOf: getNameFileUrl())
        greetingsLabel.text = "Hello, \(existingName ?? "Roberto")"
    }
    
    func getNameFileUrl() -> URL {
        let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("userName.txt")
    }

    @IBAction func rememberName(_ sender: Any) {
        let name = nameEntry.text!
        try! name.write(to: getNameFileUrl(), atomically: true, encoding: .utf8)
        greetingsLabel.text = "Hello, \(name)!"
    }
    
    @IBAction func forgetName(_ sender: Any) {
        try? FileManager.default.removeItem(at: getNameFileUrl())
        greetingsLabel.text = "Hello Mister"
    }
}

