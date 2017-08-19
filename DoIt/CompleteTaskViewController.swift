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
    var tarea: Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Extraer el nombre de la tarea
        
        if tarea!.important{
            taskLabel.text = (" ❗️ \(String(describing: tarea!.name!))")
        }else{
            taskLabel.text = tarea!.name!
        }
    }

    
    @IBAction func completeTapped(_ sender: Any) {
        
        //Obeter el dato de la base de datos y borrarlo
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(tarea!)
        //Actualizar la base de datos
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //Regresar al menú
        navigationController!.popViewController(animated: true)
    }

}
