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
    }
    
    //if any data , then validate else alert
    @IBAction func registerBtn(_ sender: Any) {
    }
  
// clik on image to move to cam view conroller
    @IBAction func profileImageBtn(_ sender: Any) {
    }
    
}
