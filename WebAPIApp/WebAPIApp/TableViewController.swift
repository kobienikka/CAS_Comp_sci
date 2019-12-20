//
//  TableViewController.swift
//  WebAPIApp
//
//  Created by Kobie Nikka on 12/18/19.
//  Copyright © 2019 Kobie Nikka. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {
    
    func getTitle(movieNum: Int) -> String {
        let url: URL = URL(string: "https://swapi.co/api/films/\(movieNum + 1)/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let charList = dictionary["characters"] as! [String]
                    let episode_id = dictionary["episode_id"] as! Int
                    
                    characterList[episode_id] = charList
                    episode_ids.append(episode_id)
                    let title: String = dictionary["title"] as! String
                    return title
                }
            }
        }
        return "oof"
    }
    
    var characterList: [Int: [String]] = [:]
    var episode_ids: [Int] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return 7
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         
        let title = getTitle(movieNum: indexPath.row)
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
        let vc = segue.destination as! TableViewController2
        // Pass the selected object to the new view controller.
        let indexPath = self.tableView.indexPathForSelectedRow
        vc.filmNum = indexPath?.row
        let episode_id = episode_ids[indexPath!.row]
        vc.characters = characterList[episode_id]
        print(characterList)
    }

}
