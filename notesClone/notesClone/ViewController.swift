//
//  ViewController.swift
//  notesClone
//
//  Created by Kobie Nikka on 11/15/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var note:Note?

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = note?.note

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        note?.note = textView.text
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
