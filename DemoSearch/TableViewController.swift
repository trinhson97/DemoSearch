//
//  TableViewController.swift
//  DemoSearch
//
//  Created by Son on 5/28/18.
//  Copyright © 2018 Son. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController , UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var string = ["Dat","Hoang","Son","Luyen","Duong","Chung","Du","Hien"]
    var string0 = [String]()
    var isActive : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        string0 = string

 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isActive {
            return string0.count
        }else{
            return string.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        if isActive {
            cell.textLabel?.text = string0[indexPath.row]
        }else{
            cell.textLabel?.text = string[indexPath.row]
        }
        

        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        string0 = searchText.isEmpty ? string : string.filter{(item : String) -> Bool in item.range(of: searchText , options : .caseInsensitive , range : nil , locale : nil) != nil}
        tableView.reloadData()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isActive = false
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isActive = true
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
