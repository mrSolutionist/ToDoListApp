//
//  SignUpVC.swift
//  ToDoApp_X12
//
//  Created by Robin George on 29/09/21.
//

import UIKit

class SignUpVC: UIViewController {
    
    //profile pic outlet
    @IBOutlet weak var camBtn: UIButton!
    
    @IBOutlet weak var profileImg: UIImageView!
    //field outlets
    @IBOutlet weak var rePasswordField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    
    //main
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //check for if any data input else back to login
    @IBAction func cancelBtn(_ sender: Any) {
        //condition check for data
        if notEmpty(){
            exit()
        }
        
    }
    
    
    //if any data , then validate else alert
    @IBAction func registerBtn(_ sender: Any) {
        
        //assigning data
        let name = nameField.text!
        
        let password = passwordField.text!
        let username = userNameField.text!
        print(name,password,username)
        
        //condition check and save
        if !notEmpty() && (passwordField.text == rePasswordField.text){
            print("hello")
            let cor = CoreDataManager.shared
            let save = cor.saveUser(name: name, password: password, username: username)
            if save {
                let alert =  UIAlertController(title: "Saved", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler:{action in self.exit()
                }))
                self.present(alert, animated: true, completion:nil )
            }
        }
    }
    
    
    
    // clik on image to move to cam view conroller
    @IBAction func profileImageBtn(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate =  self
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    //empty validte function
    func notEmpty() -> Bool {
        if (rePasswordField.text == "") && (passwordField.text == "") && (userNameField.text == "") && (nameField.text == ""){
            
            return true
        }
        return false
    }
    
    
    //pop to previous vc
    func exit()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
  
    
   
}

extension SignUpVC : UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    //deligates of imagePickerController
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let  image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            
            return
        }
        
        
        
        //passing image to profile
        profileImg.image = image
    }
}





