//
//  YYSearchTableViewController.swift
//  RuiAnMedicalCare
//
//  Created by 姚懿恒 on 2019/8/26.
//  Copyright © 2019 姚懿恒. All rights reserved.
//

import UIKit
import CoreData

class YYSearchTableViewController: UITableViewController {
    

    
    
    
    @objc var yYClientInfo = [YYClientInfo]()
    @objc var filterInfo = [YYClientInfo]()
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var detailViewController: YYDetailViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchUI()


        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as?  YYDetailViewController
            
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "添加", style: .done, target: self, action: #selector(AddPerson))
        

    }
//    override func viewWillAppear(_ animated: Bool) {
//        <#code#>
//    }
    @objc func AddPerson()
    {
        self.navigationController?.popViewController(animated: true)
    }
    func setUpSearchUI() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "输入手机号"
        navigationItem.searchController = searchController
        definesPresentationContext = true

    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if isFiltering() {
            return filterInfo.count
        }
        return yYClientInfo.count
    }
//    override func viewWillAppear(_ animated: Bool) {
//        if splitViewController!.isCollapsed {
//            if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
//                self.tableView.deselectRow(at: selectionIndexPath, animated: animated)
//            }
//        }
//        super.viewWillAppear(animated)
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "id")
        
        let client: YYClientInfo
        
        if isFiltering() {
            client = filterInfo[indexPath.row]
        }
        else
        {
            client = self.yYClientInfo[indexPath.row]
        }
        
        
        cell.accessoryType = .disclosureIndicator
        

        
        
        cell.detailTextLabel?.text = client.descriptions.lastObject as? String
//        cell.textLabel?.text = String(client.comeCount)
        cell.textLabel?.text = client.phoneNumber
        

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let client: YYClientInfo
        
        if isFiltering() {
            client = filterInfo[indexPath.row]
        }
        else
        {
            client = self.yYClientInfo[indexPath.row]
        }
//        let client = YYClientInfo[indexPath.row]


        self.performSegue(withIdentifier: "ShowDetailView", sender: client)
        
        


    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
        
        if segue.identifier == "ShowDetailView"
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                let client: YYClientInfo
                if isFiltering()
                {
                    client = filterInfo[indexPath.row]
                }
                else
                {
                    client = self.yYClientInfo[indexPath.row]
                }
                
                let destinationVC = segue.destination as! YYDetailViewController
                destinationVC.YYClientInfo = client
                
            }
            
//            destinationVC.YYClientInfo = (sender as? YYClientInfo)!
        }
//        let indexPath = self.tableView.indexPathForSelectedRow
//        
//        let client = YYClientInfo[(indexPath?.row)!]
//        
//        
//        
//        destinationVC.YYClientInfo = client
        
    }

}
extension YYSearchTableViewController: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        
        filterContentForSearchText(searchController.searchBar.text!)
    }

    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filterInfo = yYClientInfo.filter({( client : YYClientInfo) -> Bool in
            return client.phoneNumber.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    


}

