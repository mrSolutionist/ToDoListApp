//
//  CoreDataManager.swift
//  ToDoApp_X12
//
//  Created by Robin George on 30/09/21.
//

import Foundation
import CoreData


// MARK: - Core Data stack


class CoreDataManager{
    
    //    let context = CoreDataManager.shared
    static let shared = CoreDataManager()
    private init(){
        print("hi")
    }
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "ToDoApp_X12")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //  data base functions //
    
    //Saving userdata after signUp
    func saveUser(name:String, password:String, username: String) -> Bool{
        
        let userData = UserData(context:persistentContainer.viewContext)
        userData.name = name
        userData.password = password
        userData.username = username
        do {
            try persistentContainer.viewContext.save()
        } catch  {
            print("error")
        }
        
        
        return true
    }
    
    //login Validation Function
    
    func loginValidate(name:String,pass:String) -> Bool  {
        

        //this converts the arg into predicate
        let username = NSPredicate(format: "username = %@",name)
        let password = NSPredicate(format: "password = %@", pass)
        
        //
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: "UserData")
        
        //no idea what the following code does
        //mayb it uses username as predicate to search .
        fetchRequest.predicate = username
//        fetchRequest.predicate = password
        
        do
            {
               let result = try persistentContainer.viewContext.fetch(fetchRequest) as NSArray
                
                if result.count>0
                {
                    
                    let objectEntity = result.firstObject as! UserData
                    
                    let dbName = objectEntity.username!
                    let dbPassword = objectEntity.password!
                    //left part is currently object and it wont equate with string, i guss!
                    if dbName  == name && dbPassword  == pass{
                   var defaults = UserDefaults.standard
                        defaults.set(true,forKey: "UserLoggedIn")
//                        defaults.set(objectEntity,forKey: "user")
                        
                       
                        print("Login Succesfully")
                        return true
                    }
                    else
                    {
                        print("Wrong username or password !!!")
                        return false
                    }
                }
                
            }
        
        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }
        return false
    }
  
    
}






