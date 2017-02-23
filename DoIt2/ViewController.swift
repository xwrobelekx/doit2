//
//  ViewController.swift
//  DoIt2
//
//  Created by Kamil Wrobel on 2/23/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
                                    // add TableViewDelegate, and TableViewData Source
    
    
    @IBOutlet weak var tableView1: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
            // seting up DataSource, and Delegate, this is where tableView is asking howmany rows it should have and what goes inside the cells
        tableView1.dataSource = self
        
        tableView1.delegate = self
    }

   // 2 functions that the tableView need
    
    // how many rows should it have?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // what goes inside the cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         // create cell object with properties of UITableViewCell
        let cell = UITableViewCell()
        // now cell can me manipulated
        cell.textLabel?.text = "Hello"
        
        return cell
    }
    


}

