//
//  ViewController.swift
//  IceCreamPicker
//
//  Created by Kobie Nikka on 10/21/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return iceCreamFlavors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return iceCreamFlavors[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var iceCreamPicker: UIPickerView!
   
    @IBAction func order(_ sender: UIButton) {
        let row = iceCreamPicker.selectedRow(inComponent: 0)
        orderLabel.text = "Your order: 1 scoop of "+iceCreamFlavors[row] + " will cost "+iceCreamPrices[row]
    }
    
    @IBOutlet weak var orderLabel: UILabel!
    
    let iceCreamFlavors = ["Chunky Monkey", "Coffee Coffee Buzz Buzz", "Cookies N Cream", "Extra Dark Chocolate", "Pistachio"]
    
    let iceCreamPrices = ["$8", "$75", "-$5", "$6", "$3"]
    
}
