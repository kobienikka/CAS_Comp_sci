//
//  ViewController.swift
//  ageApp
//
//  Created by Kobie Nikka on 9/19/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Switch: UISwitch!
    var hadBirthday = true
    var age = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var usersAge: UILabel!
    
    @IBAction func ageStepper(_ sender: UIStepper) {
        usersAge.text = String(sender.value)
    }
    
    
    @IBAction func birthdaySwitch(_ sender: UISwitch) {
        if Switch.isOn{
         hadBirthday = true
        }else{
         hadBirthday = false
        }
    }
    
    @IBOutlet weak var birthYear: UILabel!

    
    @IBAction func calculateBirthYear(_ sender: Any) {
        let age = Int(usersAge.text ?? "0")
        var yearOfBirth = 0
        if hadBirthday {
            yearOfBirth = 2019 - age!
        } else {t
            yearOfBirth = 2019 - (age ?? 0) + 1
        }
        birthYear.text = ("you were born in: \(yearOfBirth)")
    }
}

