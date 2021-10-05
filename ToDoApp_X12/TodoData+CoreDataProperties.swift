//
//  TodoData+CoreDataProperties.swift
//  ToDoApp_X12
//
//  Created by Robin George on 05/10/21.
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
    @NSManaged public var todo: NSSet?

}

// MARK: Generated accessors for todo
extension TodoData {

    @objc(addTodoObject:)
    @NSManaged public func addToTodo(_ value: UserData)

    @objc(removeTodoObject:)
    @NSManaged public func removeFromTodo(_ value: UserData)

    @objc(addTodo:)
    @NSManaged public func addToTodo(_ values: NSSet)

    @objc(removeTodo:)
    @NSManaged public func removeFromTodo(_ values: NSSet)

}

extension TodoData : Identifiable {

}
