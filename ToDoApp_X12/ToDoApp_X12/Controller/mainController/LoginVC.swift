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

 
        
        //checking for is user is logged in via UserDefault status
        if UserDefaults.standard.bool(forKey: "UserLoggedIn") == true {
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "tabViewId") as! UserTabBarControllerVC
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
       
    }
    

    @IBAction func loginBtn(_ sender: Any) {
        let name = userNameLabel.text!
        let pass = passwordLabel.text!
        
        let loginPass = CoreDataManager.shared.loginValidate(name: name, pass: pass)
        
        // if credentials return true
        if loginPass{
            let tabVc = storyboard?.instantiateViewController(identifier: "tabViewId") as! UserTabBarControllerVC
            UIApplication.shared.windows.first?.rootViewController = tabVc
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
