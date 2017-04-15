//
//  ViewController.swift
//  BoApps
//
//  Created by Macbook Air on 4/7/2560 BE.
//  Copyright © 2560 Botanyap. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //call back function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let targetVC = segue.destination
        let selectedIndexpath = self.tableView.indexPathForSelectedRow
        let selectedCell = self.tableView.cellForRow(at: selectedIndexpath!)
        
        targetVC.title = selectedCell?.textLabel?.text
    }

}
