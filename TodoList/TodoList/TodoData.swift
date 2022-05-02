//
//  TodoData.swift
//  TodoList
//
//  Created by 김지은 on 2022/05/02.
//

import Foundation

struct todoData {
    var contents: String
    var isDone: Bool
}

class Todo {
    private static let Instance: Todo = Todo()
    private var todolist: [todoData]!
    
    init(){
        todolist = []
    }
    
    public static func getInstance() -> Todo {
        return Instance
    }
    
    public func getTodoList() -> [todoData] {
        return todolist
    }
    
    public func count() -> Int {
        todolist.count
    }
    
    public func getTodo(_ index: Int) -> todoData {
        return self.todolist[index]
    }
    
    public func addTodo(_ todo: todoData) -> Void {
        self.todolist.append(todo)
    }
    
    public func removeTodo(_ index: Int) -> Void {
        self.todolist.remove(at:index)
    }
    
    public func setCheck(_ index: Int) -> Void {
        self.todolist[index].isDone.toggle()
    }
}
