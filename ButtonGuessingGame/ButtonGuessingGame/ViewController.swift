//
//  ViewController.swift
//  ButtonGuessingGame
//
//  Created by Kobie Nikka on 2/12/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var buttonsForGame: Int?
    var answer: Int?
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Cheat Code: The Answer is \(answer!)")
        for i in 1...buttonsForGame! {
            let newButton = ButtonValue()
            newButton.setTitle("Button \(i)", for: .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 363, height: 50)
            newButton.setTitleColor(UIColor(displayP3Red: 8/255, green: 39/255, blue: 60/255, alpha: 1), for: .normal)
            newButton.backgroundColor = UIColor(red: 80/255, green: 255/255, blue: 247/255, alpha: 1)
            newButton.addTarget(self, action: #selector(whichButtonWasClicked), for: .touchUpInside)
            newButton.value = i
            stackView.addArrangedSubview(newButton)
        }
        stackView.frame = CGRect(x: 0, y: 0, width: 363, height: (50 * buttonsForGame!))
        scrollView.contentSize = CGSize(width: 363, height: (50 * buttonsForGame!))
    }
    
    @objc func whichButtonWasClicked(_ sender: ButtonValue) {
        if sender.value == answer! {
            sender.backgroundColor = UIColor(red: 133/255, green: 1, blue: 61/255, alpha: 1)
            buttonGuessedCorrect()
        } else if sender.value < answer! {
            sender.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            buttonGuessedWrongLow()
        } else if sender.value > answer! {
            sender.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            buttonGuessedWrongHigh()
        }
        sender.isEnabled = false
    }

    @objc func buttonGuessedCorrect() {
        let alert = UIAlertController(title: "Congrats", message: "You guessed the correct button", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Guess Again", style: .default, handler: {(_) in return}))
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func buttonGuessedWrongLow() {
        let alert = UIAlertController(title: "Try Again", message: "Your guess was to low. Guess a higher number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Guess Again", style: .default, handler: {(_) in return}))
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func buttonGuessedWrongHigh() {
        let alert = UIAlertController(title: "Try Again", message: "Your guess was to high. Guess a smaller number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Guess Again", style: .default, handler: {(_) in return}))
        self.present(alert, animated: true, completion: {})
    }
    
    

}

