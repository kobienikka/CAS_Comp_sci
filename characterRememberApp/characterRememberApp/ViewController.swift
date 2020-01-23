//
//  ViewController.swift
//  characterRememberApp
//
//  Created by Kobie Nikka on 1/23/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var characterInfoLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var abilityTextField: UITextField!
    
    @IBOutlet weak var petLabel: UILabel!
    @IBOutlet weak var petTextField: UITextField!
    
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var speciesTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view.
        populateInfoBox()
    }
    
    func populateInfoBox() {
        if let url = getFileURL(){
            let data = try? Data(contentsOf: url)
            if let data = data {
                let dict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:String]
                characterInfoLabel.text = """
                Name: \(dict["name"]!)
                Special Ability: \(dict["ability"]!)
                Special Pet: \(dict["pet"]!)
                Species: \(dict["species"]!)
                """
            }
        }
    }

    @IBAction func saveCharacterInfo(_ sender: UIButton) {
        let data: [String:String] = [
            "name": nameTextField.text ?? "?",
            "ability": abilityTextField.text ?? "?",
            "pet": petTextField.text ?? "?",
            "species": speciesTextField.text ?? "?",
        ]
        let url = getFileURL()
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) {
            try! jsonData.write(to: url!)
        } else {
            print("Saving Failed :(")
        }
        populateInfoBox()

    }
    
    func getFileURL() -> URL? {
        let docDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        if docDirectory != nil {
            return docDirectory!.appendingPathComponent("saveFile.json")
        }
        return nil
    }

}

