//
//  TodoViewModel.swift
//  TestSwiftUI
//
//  Created by Eric Downey on 7/1/19.
//  Copyright © 2019 Downey. All rights reserved.
//

import SwiftUI

final class TodoViewModel: Identifiable {
    
    var id: UUID {
        todo.uuid
    }
    var task: String {
        todo.task
    }
    var isComplete: Bool {
        todo.complete
    }
    
    private var todo: TodoRepresentable
    
    init(todo: TodoRepresentable) {
        self.todo = todo
    }
    
    func toggleComplete() {
        todo.complete.toggle()
    }
}
