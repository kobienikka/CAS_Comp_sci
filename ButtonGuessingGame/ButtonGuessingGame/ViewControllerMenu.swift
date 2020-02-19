//
//  ViewControllerMenu.swift
//  ButtonGuessingGame
//
//  Created by Kobie Nikka on 2/12/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewControllerMenu: UIViewController {

    var totalButtons: Int?
    
    @IBAction func easyButton(_ sender: Any) {
        return totalButtons = 20
    }
    @IBAction func mediumButton(_ sender: Any) {
        return totalButtons = 30
    }
    @IBAction func hardButton(_ sender: Any) {
        return totalButtons = 40
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as! ViewController
        // Pass the selected object to the new view controller.
        vc.buttonsForGame = totalButtons
        vc.answer = Int.random(in: 1 ... totalButtons!)
    }

}
