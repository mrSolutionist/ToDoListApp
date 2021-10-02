//
//  LoginVC.swift
//  ToDoApp_X12
//
//  Created by Robin George on 30/09/21.
//

import UIKit


class LoginVC: UIViewController {

    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var userNameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginBtn(_ sender: Any) {
        let name = userNameLabel.text!
        let pass = passwordLabel.text!
        let loginPass = CoreDataManager.shared.loginValidate(name: name, pass: pass)
        if loginPass{
            let loginVc = storyboard?.instantiateViewController(identifier: "tabViewId") as! UserTabBarControllerVC
            present(loginVc, animated: true, completion: nil)
        }
        
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
