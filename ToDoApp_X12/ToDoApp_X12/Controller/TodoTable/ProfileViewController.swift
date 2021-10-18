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
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    

        let user = CoreDataManager.shared.userFetch()
        let userId =  UserDefaults.standard.string(forKey: "userId")
        if user.userId?.uuidString == userId {
            nameLabel.text = user.name
            usernameLabel.text = user.username
//            let data =  try! Data(contentsOf:  user.image! )
//            ProfileImage.image = UIImage(data:data)
            
        }



        
    }
    
    @IBAction func LogOutBtn(_ sender: Any) {
        UserDefaults.standard.set(false,forKey: "UserLoggedIn")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginId") as! LoginVC
        UIApplication.shared.windows.first?.rootViewController = vc
        
        
    }
    
    
}
