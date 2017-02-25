//
//  CreateTaskViewController.swift
//  DoIt2
//
//  Created by Kamil Wrobel on 2/24/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
  
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var taskNameTextField: UITextField!
    
    var previousVC = TasksViewController()
        // this holds TasksVC which gone let us comunicate between view controllers

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        
    }

    
      @IBAction func addTapped(_ sender: Any) {
        
        // create task from the outlet information
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        //add a new task to array in previous VC
        
        previousVC.tasks.append(task)
        
        
        previousVC.tableView1.reloadData()
            // reloads the tableView, so when we add new items it will apeear.
        
        
        navigationController!.popViewController(animated: true)
            // this line of code (when add is tapped) brings us back to pevious VC (TasksVC)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
 
}
