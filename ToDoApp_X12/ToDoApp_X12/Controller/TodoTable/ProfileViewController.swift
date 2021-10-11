//
//  ProfileViewController.swift
//  ToDoApp_X12
//
//  Created by Robin George on 03/10/21.
//

import UIKit

class ProfileViewController: UIViewController {
    var user : UserData?
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        let arr = CoreDataManager.shared.fetchImage()
        ProfileImage.image = UIImage(data: arr[0].image!)
        
        userNameLabel.text = user?.name
    }
    
    @IBAction func LogOutBtn(_ sender: Any) {
        UserDefaults.standard.set(false,forKey: "UserLoggedIn")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginId") as! LoginVC
        UIApplication.shared.windows.first?.rootViewController = vc
        
        
    }
    
  
    
    
    
    
}
