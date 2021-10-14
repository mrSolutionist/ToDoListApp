//
//  File.swift
//  ToDoApp_X12
//
//  Created by Robin George on 14/10/21.
//

import Foundation


var todoArray : [TodoData] = []
var completedArray : [TodoData] = []

func todoOnLoad(){
  let todoList = CoreDataManager.shared.userTodoFetch()
    
    completedArray.removeAll()
    todoArray.removeAll()
    
    
    todoList.forEach { todo  in
        if todo.status{
            completedArray.append(todo)
        }
        else if !todo.status {
            todoArray.append(todo)
        }
    }




}
