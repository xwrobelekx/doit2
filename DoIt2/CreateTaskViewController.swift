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
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    @IBAction func addTapped(_ sender: Any) {
        
        // create task from the outlet information
        
        let context25 = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            //this gives as acces to propertirs in AppDelegate, and were using persistent Container property, which holds objects in Core Data
        
        let task = Task(context: context25)
            // replaced Task() with Task from entity, and is looking now for NSManagedObjectContext
            //
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
            // saves context
        
 
        
        
        navigationController!.popViewController(animated: true)
        // this line of code (when add is tapped) brings us back to pevious VC (TasksVC)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
