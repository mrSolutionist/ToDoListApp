//
//  ToDoAddViewController.swift
//  ToDoApp_X12
//
//  Created by Robin George on 05/10/21.
//

import UIKit

class ToDoAddViewController: UIViewController {
    @IBOutlet weak var todoTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func todoAdd(_ sender: Any) {
        
        ( CoreDataManager.shared.todoSave(title: todoTitle.text ?? "no title")) ? self.dismiss(animated: true, completion: nil): print("false")
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
