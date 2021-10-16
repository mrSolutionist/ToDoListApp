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
    

        let users = CoreDataManager.shared.userFetch()
        let userId =  UserDefaults.standard.integer(forKey: "userId")
        let currentUser = getUser(users: [users], userId: userId)
        let data =  try! Data(contentsOf: currentUser.image! )
        ProfileImage.image = UIImage(data:data)


        nameLabel.text = currentUser.name
        usernameLabel.text = currentUser.username
        
    }
    
    @IBAction func LogOutBtn(_ sender: Any) {
        UserDefaults.standard.set(false,forKey: "UserLoggedIn")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginId") as! LoginVC
        UIApplication.shared.windows.first?.rootViewController = vc
        
        
    }
    
  
    func getUser(users:[UserData],userId:Int) -> UserData{
        
        for user in users{
            
            if user.hashValue == userId
            {
                return user
            }
            
            else {
                
            }
           
        }
        var emptyObj = UserData()
        return emptyObj
    }
    
    
    
}
