//
//  KamusTableViewController.swift
//  KamusApps
//
//  Created by Muhammad Hilmy Fauzi on 9/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class KamusTableViewController: UITableViewController {
    let kamusURL = "http://localhost/KamusApp/index.php/api/getAllKamus"
    var kamus = [Kamus]()
    override func viewDidLoad() {
        super.viewDidLoad()

        getKamus()
        //self sizing cells
        //set row height to 92
        tableView.estimatedRowHeight = 92.0
        //set row table height to automatic dimension
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return kamus.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! KamusTableViewCell
        
        cell.labelNomor.text = kamus[indexPath.row].nomor
        cell.labelIndo.text = kamus[indexPath.row].indo
        cell.labelInggris.text = kamus[indexPath.row].inggris
        return cell
    }
    func getKamus() {
        guard let kamusurl = URL(string: kamusURL) else {
            return //this return is for back up the value that got when call variable loanURL
        }
        
        //declare request for request URL loanUrl
        let request = URLRequest(url: kamusurl)
        //declare task for take data from variable request above
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            
            //check what error is available or not
            if let error = error {
                //condition when error
                //print error
                print(error)
                return //back up value error that we get
            }
            //parse JSON data
            //declare variable data to call data
            if let data = data {
                //for this part will call method parseJsonData that we will make in below
                self.kamus = self.parseJsonData(data: data)
                
                //reload tableView
                OperationQueue.main.addOperation({
                    //reload data again
                    self.tableView.reloadData()
                })
            }
        })
        //task will resume to call the json data
        task.resume()
    }
    //create new method with name ParseJsonData
    //this method will parsing data Json
    func parseJsonData(data: Data) -> [Kamus] {
        //declare variable loans as object from loans class
        var kamus = [Kamus]()
        //will repeat to json data that parsed
        do{
            //declare jsonResult for take data from the json
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            //parse json data
            let jsonLoans = jsonResult?["data"] as! [AnyObject]
            for jsonLoan in jsonLoans {
                //declare loan as object from class loan
                let KaMuS = Kamus()
                //enter the value to each object from class loan
                KaMuS.nomor = jsonLoan["id_kamus"] as! String
                KaMuS.indo = jsonLoan["kamus_indonesia"] as! String
                KaMuS.inggris = jsonLoan["kamus_inggris"] as! String
                //process enter data to object
                kamus.append(KaMuS)
            }
        }catch{
            print(error)
        }
        return kamus
    }
}
   