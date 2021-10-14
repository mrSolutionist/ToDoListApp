//
//  TodoData+CoreDataProperties.swift
//  ToDoApp_X12
//
//  Created by Robin George on 14/10/21.
//
//

import Foundation
import CoreData


extension TodoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoData> {
        return NSFetchRequest<TodoData>(entityName: "TodoData")
    }

    @NSManaged public var discription: String?
    @NSManaged public var tiile: String?
    @NSManaged public var status: Bool

}

extension TodoData : Identifiable {

}
