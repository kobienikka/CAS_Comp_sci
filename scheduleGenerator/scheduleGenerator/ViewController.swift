//
//  ViewController.swift
//  scheduleGenerator
//
//  Created by Kobie Nikka on 10/23/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var infoPicker: UIPickerView!
    @IBOutlet weak var ScheduleLabel: UILabel!
    
    let dayTypes:[String] = ["A", "B", "C"]
    let weekdays:[String] = ["Mondays", "Tuesday", "Wednesday", "Thursday", "Friday"]
    let schedule:[String] = ["Regular", "Double Block", "Assembly"]
    let mySchedule:[String:String] = [
        "A": "Math",
        "B": "Computer Science",
        "C": "US History",
        "D": "English",
        "E": "Free Period",
        "F": "Bio",
        "Friday": "Life Skills",
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func generateSchedule(_ sender: UIButton) {
        let dayTypeRow = infoPicker.selectedRow(inComponent: 0)
        let ACBDay = dayTypes[dayTypeRow]
        let dayName = weekdays[infoPicker.selectedRow(inComponent: 1)]
        
        let periodRotation:[String:[String]] = [
            "A":["A", "B", "D", "E", "G", "H"],
            "C":["C", "A", "F", "D", "I", "G"],
            "B":["B", "C", "E", "F", "H", "I"]
        ]
        
        let FridayPeriodRotation:[String:[String]] = [
            "A":["A", "B", "D", "E", "Friday", "Friday"],
            "C":["C", "A", "F", "D", "Friday", "Friday"],
            "B":["B", "C", "E", "F", "Friday", "Friday"]
        ]
        
        if dayName == "Friday"{
            let mySched = getScheduleForDay(periods: FridayPeriodRotation[ACBDay]!, mySchedule: mySchedule)
            ScheduleLabel.text = mySched
        } else {
            let mySched = getScheduleForDay(periods: periodRotation[ACBDay]!, mySchedule: mySchedule)
            ScheduleLabel.text = mySched
        }
    }
    func getScheduleForDay(periods:[String], mySchedule:[String:String]) -> String{
        var output = ""
        for period in periods{
            output += "\(period)-"
            output += mySchedule[period] ?? "free period"
            output += "\n"
            }
        return output
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return dayTypes.count
        }
        else if component == 1 {
            return weekdays.count
        } else {
            return schedule.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return dayTypes[row]
        }
        else if component == 1 {
            return weekdays[row]
        }
        else {
            return schedule[row]
        }
    }
    


}

