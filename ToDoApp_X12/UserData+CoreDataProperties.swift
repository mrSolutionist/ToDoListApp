//
//  UserData+CoreDataProperties.swift
//  ToDoApp_X12
//
//  Created by Robin George on 30/09/21.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var name: String?
    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension UserData : Identifiable {

}
