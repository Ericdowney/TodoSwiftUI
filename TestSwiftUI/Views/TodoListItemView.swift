//
//  TodoListItemView.swift
//  TestSwiftUI
//
//  Created by Eric Downey on 7/2/19.
//  Copyright © 2019 Downey. All rights reserved.
//

import SwiftUI

struct TodoListItemView : View {
    
    @EnvironmentObject var store: AppStore
    
    let todo: TodoViewModel
    
    var body: some View {
        Button(action: {
            self.toggleComplete()
        }) {
            HStack {
                Text("Task")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(todo.task)
                    .font(.headline)
                    .foregroundColor(todo.isComplete ? Color.green : Color.red)
                Spacer()
                Image(systemName: todo.isComplete ? "checkmark.circle" : "circle")
                    .foregroundColor(todo.isComplete ? Color.green : Color.red)
            }
        }
    }
    
    private func toggleComplete() {
        store.toggleComplete(for: todo)
    }
}

#if DEBUG
struct TodoListItemView_Previews : PreviewProvider {
    
    private static var isFrameVisible: Bool = false
    
    static var previews: some View {
        Group {
            TodoListItemView(todo: TodoViewModel(todo: previewData[0]))
            TodoListItemView(todo: TodoViewModel(todo: previewData[1]))
        }
        .border(isFrameVisible ? Color(red: 0.9, green: 0.9, blue: 0.9) : Color.clear)
        .padding()
        .previewLayout(.sizeThatFits)
        .environmentObject(AppStore(todos: previewData.compactMap { TodoViewModel(todo: $0) }))
    }
}
#endif
