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
    
    var rowNum: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view.
        populateInfoBox()
    }
     
//    override func viewWillDisappear(_ animated: Bool) {
//
//    }
    
    func populateInfoBox() {
        // get current row
        // deserialize array of dicts
        // load data from that row if it exists
        if let url = getFileURL(){
            let data = try? Data(contentsOf: url)
            if let data = data {
//                print(try? JSONSerialization.jsonObject(with: data, options: []))
                guard let allData = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String:String]]
                else {
                    return
                }
                var dict: [String:String]? = nil
                if rowNum != nil {
                    dict = allData[rowNum!]
                } else {
                    dict = allData[allData.count-1]
                }
                
                characterInfoLabel.text = """
                Name: \(dict!["name"]!)
                Special Ability: \(dict!["ability"]!)
                Special Pet: \(dict!["pet"]!)
                Species: \(dict!["species"]!)
                """
            }
        }
    }

    @IBAction func saveCharacterInfo(_ sender: UIButton) {
        // Try to read and see if anything is stored already
        // if stored, load the [[String:String]] array of dicts
        /**
         
         guard let allData = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String:String]]
            else
        var allData = [] // dynamic resizable list
         */
        let url = getFileURL()
        if url == nil {
            return
        }
        let allDataJSON = try? Data(contentsOf: url!)
        var allData: [[String:String]]?
        
        if allDataJSON == nil {
            allData = []
        } else {
            allData = try? JSONSerialization.jsonObject(with:allDataJSON!, options: []) as? [[String:String]]
        }
        
        
        // get the data (below)
        let data: [String:String] = [
            "name": nameTextField.text ?? "?",
            "ability": abilityTextField.text ?? "?",
            "pet": petTextField.text ?? "?",
            "species": speciesTextField.text ?? "?",
        ]
        //  if current row number from tableViewController is in allData,then replace that index with data
        // else
        //  allData.append(data)
        
        if rowNum == nil {
            allData!.append(data)
        } else {
            allData![rowNum!] = data
        }
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: allData, options: []) {
            try! jsonData.write(to: url!)
        } else {
            print("Saving Failed :(")
        }
        populateInfoBox()
//        saveDataToCloud()
    }
    
    
    func getFileURL() -> URL? {
        let docDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        if docDirectory != nil {
            return docDirectory!.appendingPathComponent("newSaveFile.json")
        }
        return nil
    }

}

