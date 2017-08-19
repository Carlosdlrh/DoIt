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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tarea = tasks[indexPath.row]
        
        if tarea.important{
            cell.textLabel?.text = " ❗️ \(String(describing: tarea.name!))"
        }else{
            cell.textLabel?.text = tarea.name!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Obtener numero 
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectedTaskSegue", sender: task)
    }
    
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(Task.self)
            
        }catch{
            print("Opps we have an error")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Diferenciador de caminos "Segue" con identificador if
        
        if segue.identifier == "selectedTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
                nextVC.tarea = sender as? Task
        }
        
    }
    
    //Nunca se va a usar -----------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

