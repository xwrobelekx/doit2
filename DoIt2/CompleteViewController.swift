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
    
    var task = Task()
        // created new property of type Task

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if task.important {
            completeLabel1.text = "❗️\(task.name)"
        } else {
            completeLabel1.text = task.name
            
        }
        // if statement checks wheather the wsak is important or not, and if it is it assigns the ❗️in front of it.
        
        
        
        
        
    }

    
    @IBAction func completeTapped2(_ sender: Any) {
        
        
        
    }

}
