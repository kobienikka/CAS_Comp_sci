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
    

    
    
    @IBOutlet weak var usersAge: UILabel!
    
    @IBAction func ageStepper(_ sender: UIStepper) {
        usersAge.text = String(sender.value)
    }
    
    
    @IBAction func birthdaySwitch(_ sender: UISwitch) {
        if Switch.isOn{
            hadBirthday = true
        } else {
            hadBirthday = false
        }
    }
    
    @IBOutlet weak var birthYear: UILabel!
    
    
    @IBAction func calculateBirthYear(_ sender: Any) {
        let myText = usersAge.text
        print(myText)

        
        if let age = Float(usersAge.text!){
            var yearOfBirth:Float = 0.0
            if hadBirthday {
                yearOfBirth = 2019 - age
            } else {
                yearOfBirth = 2019 - (age ?? 0) - 1
            }
            birthYear.text = ("you were born in: \(yearOfBirth)")
        }else{
//            print("something went wrong.")
            birthYear.text = (myText)

        }
    }
}
