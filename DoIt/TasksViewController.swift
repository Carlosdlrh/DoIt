//
//  TasksViewController.swift
//  DoIt
//
//  Created by CarlosDeLaRocha on 8/3/17.
//  Copyright © 2017 Carlos de la Rocha. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTask()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tarea = tasks[indexPath.row]
        
        if tarea.important{
            cell.textLabel?.text = " ❗️ \(tarea.name)"
        }else{
            cell.textLabel?.text = tarea.name
        }
        return cell
    }
    
    func makeTask() -> [Task]{
        
        let task1 = Task()
        task1.name = "Alimentar el perro"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Comprar queso"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Cortar el cesped"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
    }
    
    //Nunca se va a usar -----------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

