//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by CarlosDeLaRocha on 8/10/17.
//  Copyright © 2017 Carlos de la Rocha. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    var tarea = Task()
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Extraer el nombre de la tarea
        
        if tarea.important{
            taskLabel.text = " ❗️ \(tarea.name)"
        }else{
            taskLabel.text = tarea.name
        }
    }

    
    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }

}
