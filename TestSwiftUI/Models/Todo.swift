//
//  Todo.swift
//  TestSwiftUI
//
//  Created by Eric Downey on 7/1/19.
//  Copyright © 2019 Downey. All rights reserved.
//

import Foundation

class Todo {
    var uuid: UUID
    var task: String
    var complete: Bool
    
    init(uuid: UUID, task: String, complete: Bool) {
        self.uuid = uuid
        self.task = task
        self.complete = complete
    }
}

extension Todo: TodoRepresentable {}
