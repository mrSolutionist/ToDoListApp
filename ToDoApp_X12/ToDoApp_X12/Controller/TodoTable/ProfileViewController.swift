//
//  ProfileViewController.swift
//  ToDoApp_X12
//
//  Created by Robin George on 03/10/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogOutBtn(_ sender: Any) {
        UserDefaults.standard.set(false,forKey: "UserLoggedIn")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginId") as! LoginVC
        UIApplication.shared.windows.first?.rootViewController = vc
        
        
    }
    
    
}