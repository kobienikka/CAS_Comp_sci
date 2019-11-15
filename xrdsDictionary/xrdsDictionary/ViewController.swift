//
//  ViewController.swift
//  xrdsDictionary
//
//  Created by Kobie Nikka on 11/6/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var Definition: UILabel!
   
    var vocabDefinition:String = ""
    var vocabWord:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleLabel.text = vocabWord
        Definition.text = vocabDefinition
    
        // Do any additional setup after loading the view.
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
