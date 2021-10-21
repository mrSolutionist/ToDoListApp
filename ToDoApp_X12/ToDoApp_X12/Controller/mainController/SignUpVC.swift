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
    @IBOutlet weak var lastNameField: UITextField!
    
    
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
    @IBAction func registerBtn(_ sender: Any)   {
        
        //assigning data
        let name = nameField?.text
        let Lname = lastNameField?.text
        
        let password = passwordField?.text
        let repassword = rePasswordField?.text
        let username = userNameField?.text

        //condition check and save
        if !notEmpty() && ( password == repassword){
            
            let defaultImg  = #imageLiteral(resourceName: "person.crop.circle@2x.png")
            // image taken is converted to binary, png
            let imageData = profileImg.image?.pngData() ?? defaultImg.pngData()
            
            //saving func called in core data
            let save = CoreDataManager.shared.saveUser(name: name ?? "no name", password: password ?? "no password", username: username ?? "no username",lastname: Lname ?? "no lastname" ,data: imageData! )
            
            //if save return true
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
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
}
// confirming deligate of imagePicker
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





