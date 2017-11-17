//
//  StacheTableViewController.swift
//  Geo Stache
//
//  Created by Kenan Casey on 10/25/17.
//  Copyright © 2017 Freed-Hardeman University. All rights reserved.
//

import UIKit

class LeaderboardTableViewController: UITableViewController {
    
    var data: [TeamObject]?
    var filteredData = [TeamObject]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = teamDataSet.teamSampleData
        
        setupSearchController()
        
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }
    
    func setupSearchController() {
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search Staches"
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredData.count
        }
        
        return data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderboardCell", for: indexPath)
        
        // Configure the cell...
        
        if let leaderboardCell = cell as? LeaderboardTableViewCell {
            if let therealdata = data {
                let team:TeamObject
                
                if isFiltering() {
                    team = filteredData[indexPath.row]
                }
                else {
                    team = therealdata[indexPath.row]
                }
                
                leaderboardCell.lbTeamNameLabel?.text = team.teamName
                leaderboardCell.lbWinsLabel?.text = team.wins
                

                

            }
        }
        
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier {
            if identifier == "teamSegue" {
                if let svc = segue.destination as? TeamSegueViewController,
                    let cell = sender as? UITableViewCell,
                    let data = data {
                    if let indexPath = tableView.indexPath(for: cell) {
                        if isFiltering(){
                            svc.team = filteredData[indexPath.row]
                        } else {
                            svc.team = data[indexPath.row]
                        }
                        
                    }
                }
                
            }
        }
        
    }
    
    func filterContentForSearchText (_ searchText: String){
        guard let data = data else {return}
        
        filteredData = data.filter({ (team) -> Bool in
            if let name = team.teamName {
                return name.lowercased().contains(searchText.lowercased())
            }
            
            return false
        })
        
        tableView.reloadData()
        
        
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
}

extension LeaderboardTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            filterContentForSearchText(text)
        }
    }
}

