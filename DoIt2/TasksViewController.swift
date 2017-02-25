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
    
    

    
    var tasks : [Task] = []
        // property for viewController that holds all the things drom create tasks function
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tasks = makeTasks()
        
        
            // seting up DataSource, and Delegate, this is where tableView is asking howmany rows it should have and what goes inside the cells
        tableView1.dataSource = self
        
        tableView1.delegate = self
    }

   // 2 functions that the tableView need
    
    // how many rows should it have?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
         // before we just set it to 10, now it goes to the tesks array and checks how many items are there
    }
    
    // what goes inside the cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         // create cell object with properties of UITableViewCell
        let cell = UITableViewCell()
        // now cell can me manipulated
        let task = tasks[indexPath.row]
            // this give you task object
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
            // replaced the string hello with task.name
        }
            // if statement checks wheather the wsak is important or not, and if it is it assigns the ❗️in front of it.
        
        
        
        return cell
    }
    
    // function that creates some exaple tasks
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "ggg"
        task1.important = false
        
        let task2 = Task()
        task2.name = "hhhh"
        task2.important = true
        
        let task3 = Task()
        task3.name = "kkk"
        task3.important = false
        
        return [task1, task2, task3]
    
    }
                // added action for the plus button
        @IBAction func plusTapped(_ sender: Any) {
                // performs a segue to the next view controller
        performSegue(withIdentifier: "addSegue", sender: nil)
            
    }
    
    
    


}

