//
//  DataViewController.swift
//  WebAPIApp
//
//  Created by Kobie Nikka on 12/19/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    var whatCharacter: String?
//    var characterName: String?
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var dataLabel: UILabel!
    
    func getData(url: String) -> [String: String] {
        let url: URL = URL(string: "\(url)")!
               let responseData: Data? = try? Data(contentsOf: url)
               if let responseData = responseData {
                   let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                   if let json = json {
                       let dictionary: [String: Any]? = json as? [String: Any]
                       if let dictionary = dictionary {
                        let name = dictionary["name"] as? String
                            let name2 = name ?? "n/a"
                        let height = dictionary["height"] as? String
                            let height2 = height ?? "n/a"
                        let mass = dictionary["mass"] as? String
                            let mass2 = mass ?? "n/a"
                        let hair_color = dictionary["hair_color"] as? String
                            let hair_color2 = hair_color ?? "n/a"
                        let skin_color = dictionary["skin_color"] as? String
                            let skin_color2 = skin_color ?? "n/a"
                        let birth_year = dictionary["birth_year"] as? String
                            let birth_year2 = birth_year ?? "n/a"
                        let gender = dictionary["gender"] as? String
                            let gender2 = gender ?? "n/a"
                        return [
                            "name": name2,
                            "height": height2,
                            "mass": mass2,
                            "hair_color": hair_color2,
                            "skin_color": skin_color2,
                            "birth_year": birth_year2,
                            "gender": gender2
                        ]
                   }
               }
        }
        return ["mistake": "oof"]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let characterData = getData(url: whatCharacter!)
        
        nameLabel.text! = characterData["name"] ?? "n/a"
        dataLabel.text! = """
        Height: \(characterData["height"] ?? "N/A")cm
        Mass: \(characterData["mass"] ?? "N/A")
        Hair Color: \(characterData["hair_color"] ?? "N/A")
        Skin Color: \(characterData["skin_color"] ?? "N/A")
        Birth Year: \(characterData["birth_year"] ?? "N/A")
        Gender: \(characterData["gender"] ?? "N/A")
        """
        
        
        
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
