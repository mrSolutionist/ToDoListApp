//
//  UserData+CoreDataProperties.swift
//  ToDoApp_X12
//
//  Created by Robin George on 11/10/21.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var image: Data?

}

extension UserData : Identifiable {

}

extension UserData : Encodable{
    public func encode(to encoder: Encoder) throws {
        
    }
    
    
}
