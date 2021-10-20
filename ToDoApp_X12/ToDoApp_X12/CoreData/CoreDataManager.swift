//
//  CoreDataManager.swift
//  ToDoApp_X12
//
//  Created by Robin George on 30/09/21.
//

import Foundation
import CoreData
import UIKit

// MARK: - Core Data stack


class CoreDataManager{
    let userFetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: "UserData")
    
    
    let userTodoFetchResult = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoData")
    var objectEntity : UserData?
    
    static let shared = CoreDataManager()
    
    private init(){
    }
    
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "ToDoApp_X12")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
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
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
    //MARK: USER SAVING AND LOGIN FUNCTIONS
    
    //Saving userdata after signUp
    func saveUser(name:String, password:String, username: String , data:Data) -> Bool{
        
        let userData = UserData(context:persistentContainer.viewContext)
        userData.name = name
        userData.password = password
        userData.username = username
        userData.userId = UUID()
        userData.image = data
        
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
        let password = NSPredicate(format: "password = %@",pass)
        
        
        //passes argument as predicate to filter the exact keyword to fetch
        userFetchRequest.predicate = username
        userFetchRequest.predicate = password
        
        
        do
            {
                let result = try persistentContainer.viewContext.fetch(userFetchRequest) as NSArray
                
                if result.count>0
                {
                    
                    objectEntity = result.firstObject as? UserData
                    
                    let dbName = objectEntity!.username!
                    let dbPassword = objectEntity!.password!
                    let userId = objectEntity!.userId?.uuidString
                    
                    if dbName  == name && dbPassword  == pass{
                        let defaults = UserDefaults.standard
                        defaults.set(true,forKey: "UserLoggedIn")
                        defaults.set(userId, forKey: "userId")
                        
                        
                        
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
    
    
    
    
    //fetch user
    func userFetch() -> UserData? {
        
        let userId = UserDefaults.standard.string(forKey: "userId")
        let predicateUserId = NSPredicate(format: "userId = %@",userId!)
        
        userFetchRequest.predicate = predicateUserId
        let result = try! persistentContainer.viewContext.fetch(userFetchRequest) as NSArray
        if result.count > 0 {
            return result.firstObject as? UserData
        }
        return nil
    }
    
    
    //MARK:Class functions
    
    //user todo data fetch
    
    func userTodoFetch() -> [TodoData]  {
        let todo = try! persistentContainer.viewContext.fetch(userTodoFetchResult) as? [TodoData]
        
        return todo!
    }
    
    
    //todo fetch
    func todoSave(title:String ,description:String) -> Bool {
        let todoUser = TodoData(context: persistentContainer.viewContext)
        
        todoUser.tiile = title
        todoUser.status = false
        todoUser.discription = description
        
        do {
            try persistentContainer.viewContext.save()
            return true
            
        }
        catch
        {
            return false
        }
        
        
        
    }
    
    //delete
    func delete(_ list: TodoData ){
        persistentContainer.viewContext.delete(list)
        try! persistentContainer.viewContext.save()
        
    }
}






