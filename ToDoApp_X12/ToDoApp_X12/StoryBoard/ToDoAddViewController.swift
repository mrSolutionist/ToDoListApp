//
//  ToDoAddViewController.swift
//  ToDoApp_X12
//
//  Created by Robin George on 07/10/21.
//

import UIKit

protocol Reload {
    func reloadTable()
}

class ToDoAddViewController: UIViewController {
    
    var delegate: Reload?
    
    @IBOutlet weak var todoTitle: UITextField!
  
    @IBOutlet weak var todoDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
   
    @IBAction func todoAdd(_ sender: Any) {
        
        CoreDataManager.shared.todoSave(title: todoTitle.text ?? "no title", description: todoDescription.text ?? "no desc") ?
            self.dismiss(animated: true, completion: {
                self.delegate?.reloadTable()
            }) : print("no value")
        
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
