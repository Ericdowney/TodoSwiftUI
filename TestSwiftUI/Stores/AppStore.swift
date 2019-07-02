//
//  AppStore.swift
//  TestSwiftUI
//
//  Created by Eric Downey on 7/1/19.
//  Copyright © 2019 Downey. All rights reserved.
//

import SwiftUI
import Combine

final class AppStore: BindableObject {
    
    var didChange: PassthroughSubject<AppStore, Never> = .init()
    
    var todos: [TodoViewModel]
    
    init(todos: [TodoViewModel]) {
        self.todos = todos
    }
    
    func addTodo(_ dto: TodoDTO) {
        todos.append(TodoViewModel(todo: dto.toModel()))
        didChange.send(self)
    }
    
    func toggleComplete(for todo: TodoViewModel) {
        if let toBeCompleteTodo = todos.first(where: { $0.id == todo.id }) {
            toBeCompleteTodo.toggleComplete()
            didChange.send(self)
        }
    }
}

fileprivate extension TodoDTO {
    
    func toModel() -> Todo {
        Todo(uuid: UUID(), task: task, complete: complete)
    }
}
