//
//  UserData+CoreDataProperties.swift
//  ToDoApp_X12
//
//  Created by Robin George on 19/10/21.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var userId: UUID?
    @NSManaged public var username: String?

}

extension UserData : Identifiable {

}
