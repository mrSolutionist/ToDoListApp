//
//  SignUpVC.swift
//  ToDoApp_X12
//
//  Created by Robin George on 29/09/21.
//

import UIKit

class SignUpVC: UIViewController {
    
    //profile pic outlet
    @IBOutlet weak var profileImage: UIButton!
    
    //field outlets
    @IBOutlet weak var rePasswordField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    
    //main
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //check for if any data input else back to login
    @IBAction func cancelBtn(_ sender: Any) {
        //condition check for data
        if notEmpty(){
            
            //VC change
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    //if any data , then validate else alert
    @IBAction func registerBtn(_ sender: Any) {
        
        //assigning data
        let name = nameField.text!
        let password = passwordField.text!
        let username = userNameField.text!
        
        //condition check and save
        if !notEmpty() && (passwordField.text == rePasswordField.text){
            let save = CoreDataManager.shared.userData(name: name, password: password, username: username)
            if save {
               let alert =  UIAlertController(title: "Saved", message: nil, preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
      
        
    }
    
    // clik on image to move to cam view conroller
    @IBAction func profileImageBtn(_ sender: Any) {
    }
    
    
    //empty validte function
    func notEmpty() -> Bool {
        if (rePasswordField.text == "") && (passwordField.text == "") && (userNameField.text == "") && (nameField.text == ""){
            
            return true
        }
        return false
    }

    
}




