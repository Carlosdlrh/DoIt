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
    
    //Crear directamente el arreglo
    var tasks: [Task] = []
    //Selecionar direcamente la linea y enumerarla
    var selectedIndex = 0
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Obtener numero
        selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectedTaskSegue", sender: task)
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
        
        //Diferenciador de caminos "Segue" con identificador if
        if segue.identifier == "addSegue"{
            let nextVC = segue.destination as! CreateTaskViewController
                nextVC.previousVC = self
        }
        
        if segue.identifier == "selectedTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
                nextVC.tarea = sender as! Task
                nextVC.previousVC = self
        }
        
    }
    
    //Nunca se va a usar -----------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

