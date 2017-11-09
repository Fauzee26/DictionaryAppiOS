//
//  KamusTableViewController.swift
//  KamusApps
//
//  Created by Muhammad Hilmy Fauzi on 9/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class KamusTableViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! KamusTableViewCell
//
//        cell.labelIndo.text = kamus[indexPath.row].indo
//        cell.labelInggris.text = kamus[indexPath.row].inggris
//
//        return cell
//    }
    
}
   
