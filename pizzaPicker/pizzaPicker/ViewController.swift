//
//  ViewController.swift
//  pizzaPicker
//
//  Created by Kobie Nikka on 10/16/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
      @IBOutlet weak var pizzaPicker: UIPickerView!
      
      @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaFlavors[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaFlavors.count
    }

    @IBAction func orderButton(_ sender: Any) {
        let row = pizzaPicker.selectedRow(inComponent: 0)
        label.text = "you ordered a: "+pizzaFlavors[row]
    }
    
    let pizzaFlavors = ["Meat Lovers", "Cheese", "Hawaiian", "Greek"]
}
