//
//  CompleteViewController.swift
//  DoIt2
//
//  Created by Kamil Wrobel on 2/24/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    @IBOutlet weak var completeLabel1: UILabel!
    
    var task : Task? = nil
   // var task = Task()
        // created new property of type Task
    // new property of type Task optional that initially is set to nil


    override func viewDidLoad() {
        super.viewDidLoad()

        if task!.important {
            completeLabel1.text = "❗️\(task!.name!)"
        } else {
            completeLabel1.text = task!.name!
            
        }
        // if statement checks wheather the wsak is important or not, and if it is it assigns the ❗️in front of it.
    }

    
    @IBAction func completeTapped2(_ sender: Any) {
        
          let context25 = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // creates context property
        context25.delete(task!)
        //deletes object (selected task)
          (UIApplication.shared.delegate as! AppDelegate).saveContext()
        // saves changes back to core Data
        
        navigationController!.popViewController(animated: true)
        // this line of code (when add is tapped) brings us back to pevious VC (TasksVC)
        
        
        
        
        
    }

}
