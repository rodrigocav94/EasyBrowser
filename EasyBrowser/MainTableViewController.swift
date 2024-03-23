//
//  MainTableViewController.swift
//  EasyBrowser
//
//  Created by Rodrigo Cavalcanti on 23/03/24.
//

import UIKit

class MainTableViewController: UITableViewController {
    var websites = ["apple.com", "google.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "EasyBrowser"
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return websites.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? WebViewController {
            vc.selectedWebsite = websites[indexPath.row]
            vc.websites = websites
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
