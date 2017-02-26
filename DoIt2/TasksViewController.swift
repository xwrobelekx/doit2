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
    
    var tasks : [Task] = []
    // property for viewController that holds all the things drom create tasks function
    
    //view did load gets called only one time when the app is loading, where view will apppear gets called everytime were going back to that view
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // seting up DataSource, and Delegate, this is where tableView is asking howmany rows it should have and what goes inside the cells
        tableView1.dataSource = self
        
        tableView1.delegate = self
    }
     // view will appear notifies view controller that its view is about to be added to view hierarchy
    // this function gets called everytime your view is about to appear, wheather your starting the app, or coming back from differend view
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        
        tableView1.reloadData()
        //reloads the data, so then something is added, it imidietley apperas in the VC
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
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
            // replaced the string hello with task.name
        }
        // if statement checks wheather the wsak is important or not, and if it is it assigns the ❗️in front of it.
        
        
        
        return cell
    }
    
    // what happens when we press on a cell (row)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        // created task object
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
        //sending task object thru sender in segue " selectTask Segue"
        
    }
    

    // added action for the plus button
    @IBAction func plusTapped(_ sender: Any) {
        // performs a segue to the next view controller
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    
    // the purpose of this getTasks function is to get everything out of core Data and put it in the tasks array.
    
    func getTasks() {
          let context25 = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    // creates context property by accessing AppDelegate property persistent Container
        do {
            
        
        tasks = try context25.fetch(Task.fetchRequest()) as! [Task]
            // fetch gives us back an array of objects, then we need to specyfi what kinf od object, and request the fetch
            
            print(tasks)
            // fetch may throw an error, so we need to do the  "do, try, catch thing" to prevent or handle those errors
        
        } catch {
            print("we have an error")
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteViewController
            // created new property  called nextVC and assigned its destination as CompleteVC
            nextVC.task = sender as? Task
            //this line of code specifies that the new task that were sending in is of type Task, this is because the prepare for segue taked any type of sender, and here were specyfing it.
            
        }
        // when calling the segue, the if statement checks which segue was called and executes coresponding code
    }
    
    
    
}

