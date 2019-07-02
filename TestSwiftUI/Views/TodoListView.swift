//
//  TodoListView.swift
//  TestSwiftUI
//
//  Created by Eric Downey on 7/1/19.
//  Copyright © 2019 Downey. All rights reserved.
//

import SwiftUI

struct TodoListView : View {
    
    @EnvironmentObject var store: AppStore
    
    @State var shouldDisplayAddTodoModal: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.todos) {
                TodoListItemView(todo: $0)
            }
            .listStyle(.grouped)
            .navigationBarTitle(Text("Todos"))
            .navigationBarItems(trailing: Button(action: { self.shouldDisplayAddTodoModal.toggle() }) {
                Image(systemName: "plus.circle")
                    .frame(minWidth: 44, minHeight: 44)
            })
        }
        .presentation(shouldDisplayAddTodoModal ? addTodoModal : nil)
    }
    
    private var addTodoModal: Modal {
        Modal(AddTodoView(isPresented: $shouldDisplayAddTodoModal).environmentObject(store))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            TodoListView()
                .environment(\.colorScheme, .light)
            
            TodoListView()
                .environment(\.colorScheme, .dark)
        }
        .environmentObject(AppStore(todos: previewData.compactMap { TodoViewModel(todo: $0) }))
    }
}
#endif
