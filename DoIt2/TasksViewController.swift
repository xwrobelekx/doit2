//
//  TasksViewController.swift
//  DoIt2
//
//  Created by Kamil Wrobel on 2/23/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
                                    // add TableViewDelegate, and TableViewData Source
    
    
    @IBOutlet weak var tableView1: UITableView!
    
    var selectedIndex = 0

    
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
    
            // what happens when we press on a cell (row)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
            // this line of code tell as where in the array is the item that we tapped (selected)
        
        let task = tasks[indexPath.row]
            // created task object
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
            //sending task object thru sender in segue " selectTask Segue"
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
        
        // were created a constant called nextVC which destination is in CreateTaskVC, then we can acces properties from CTVC, so we said nextVC.PreviousVC is the same thing
        // this alows us to create task in CTVC and assign it in TVC
        
        }
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteViewController
                // created new property  called nextVC and assigned its destination as CompleteVC
            nextVC.task = sender as! Task
                //this line of code specifies that the new task that were sending in is of type Task, this is because the prepare for segue taked any type of sender, and here were specyfing it.
            
            nextVC.previousVC = self
                // CompleteVC has a property called previousVC which is assigned to TaskVC, and here were letting them to comunicate between each other, and therefore, were gone be able to delete (complete) tasks
            
        }
        // when calling the segue, the if statement checks which segue was called and executes coresponding code
    }
    


}

