//
//  TestTableViewController.swift
//  xrdsDictionary
//
//  Created by Kobie Nikka on 11/5/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let vocab:[String:String] = [
        "Allyween":"Halloween festivities in the Crossroads alley",
        "Cadena":"The feeding grounds",
        "Green Tent":"A tent that is green and contains overpriced foods",
        "Science Building":"The big building at the end of the alley that contains the sciences classes",
        "Rocio":"The gate keeper at Crossroads",
    ]
    
    var vocabWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        vocabWords = Array(vocab.keys).sorted()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocabWords.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let title = vocabWords[indexPath.row]
        cell.textLabel!.text = title
        

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as! ViewController
        // Pass the selected object to the new view controller.
        let indexPath = self.tableView.indexPathForSelectedRow
        let word = self.vocabWords[indexPath!.row]
        vc.vocabWord = word
        vc.vocabDefinition = self.vocab[word]!
    }


}
