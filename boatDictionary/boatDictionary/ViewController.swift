//
//  ViewController.swift
//  boatDictionary
//
//  Created by Kobie Nikka on 11/14/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var boat:Boat?

    @IBOutlet weak var boatNameLabel: UILabel!
    @IBOutlet weak var boatNameColor: UILabel!
    @IBOutlet weak var boatNameSize: UILabel!
    @IBOutlet weak var boatNameDP: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boatNameLabel.text = boat?.name
        boatNameColor.text = boat?.color
        boatNameSize.text = boat?.size
        boatNameDP.text = "\(boat?.dolphinPower)"

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
