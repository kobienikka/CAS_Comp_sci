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
    var answer: String?
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Cheat Code: The Answer is \(answer!)")
        for i in 1...buttonsForGame! {
            let newButton = UIButton()
            newButton.setTitle("Button \(i)", for: .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 363, height: 50)
            newButton.setTitleColor(UIColor(displayP3Red: 0, green: 0, blue: 1, alpha: 1), for: .normal)
            newButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 150/255, alpha: 1)
//            newButton.tag = i
            newButton.addTarget(self, action: #selector(whichButtonWasClicked), for: .touchUpInside)
            stackView.addArrangedSubview(newButton)
        }
        stackView.frame = CGRect(x: 0, y: 0, width: 363, height: (50 * buttonsForGame!))
        scrollView.contentSize = CGSize(width: 363, height: (50 * buttonsForGame!))
    }
    
    @objc func whichButtonWasClicked(_ sender: UIButton) {
        var numOfButton: String?
        let buttonTitle = sender.titleLabel?.text!
        if buttonTitle!.count == 8 {
            numOfButton = String(buttonTitle!.suffix(1))
        } else {
            numOfButton = String(buttonTitle!.suffix(2))
        }
        
        if numOfButton == answer! {
            buttonGuessedCorrect()
        } else {
            buttonGuessedWrong()
        }
    }

    @objc func buttonGuessedCorrect() {
        let alert = UIAlertController(title: "Congrats", message: "You guessed the correct button", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Guess Again", style: .default, handler: {(_) in return}))
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func buttonGuessedWrong() {
        let alert = UIAlertController(title: "Try Again", message: "You guessed the wrong button", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Guess Again", style: .default, handler: {(_) in return}))
        self.present(alert, animated: true, completion: {})
    }
    
    

}

