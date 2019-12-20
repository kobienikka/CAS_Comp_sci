//
//  ViewController.swift
//  anotherSwapiApp
//
//  Created by Kobie Nikka on 12/11/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressOne(_ sender: Any) {
         let url: URL = URL(string: "https://swapi.co/api/films/1/")!
           let responseData: Data? = try? Data(contentsOf: url)
           if let responseData = responseData {
               let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
               if let json = json {
                   let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let director: String? = dictionary["director"] as? String
                    let release_date: String? = dictionary["release_date"] as? String
                    if let title2:String = title,
                        let director2:String = director,
                        let release_date2:String = release_date {
                            nameLabel.text = "The Star wars film \(title2), was directed by \(director2) and came out on \(release_date2)."
    }}}}}
    @IBAction func pressTwo(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/2/")!
               let responseData: Data? = try? Data(contentsOf: url)
               if let responseData = responseData {
                   let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                   if let json = json {
                       let dictionary: [String: Any]? = json as? [String: Any]
                    if let dictionary = dictionary {
                        let title: String? = dictionary["title"] as? String
                        let director: String? = dictionary["director"] as? String
                        let release_date: String? = dictionary["release_date"] as? String
                        if let title2:String = title,
                            let director2:String = director, let release_date2:String = release_date {
                                nameLabel.text = "The Star wars film \(title2), was directed by \(director2) and came out on \(release_date2)."
        }}}}
    }
    
    @IBAction func pressThree(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/3/")!
               let responseData: Data? = try? Data(contentsOf: url)
               if let responseData = responseData {
                   let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                   if let json = json {
                       let dictionary: [String: Any]? = json as? [String: Any]
                    if let dictionary = dictionary {
                        let title: String? = dictionary["title"] as? String
                        let director: String? = dictionary["director"] as? String
                        let release_date: String? = dictionary["release_date"] as? String
                        if let title2:String = title,
                            let director2:String = director, let release_date2:String = release_date {
                                nameLabel.text = "The Star wars film \(title2), was directed by \(director2) and came out on \(release_date2)."
        }}}}
    }
}


