//
//  AddTodoListView.swift
//  TestSwiftUI
//
//  Created by Eric Downey on 7/1/19.
//  Copyright © 2019 Downey. All rights reserved.
//

import SwiftUI

struct AddTodoView : View {
    
    @EnvironmentObject var store: AppStore
    
    @Binding var isPresented: Bool
    
    @State private var todoTask: String = ""
    @State private var todoComplete: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Text("Task")
                    TextField($todoTask, placeholder: Text("Task Name"))
                        .padding(4.0)
                        .padding([.top, .bottom], 4.0)
                        .border(Color.secondary, cornerRadius: 4.0)
                }
                Section {
                    HStack {
                        Toggle(isOn: $todoComplete) {
                            Text("Is Task Complete?")
                        }
                    }
                }
                }
                .navigationBarTitle(Text("Add Todo"))
                .navigationBarItems(leading: cancelButton, trailing: saveTodoButton)
        }
    }
    
    private var cancelButton: some View {
        Button(action: dismiss) {
            Text("Cancel")
                .fontWeight(.light)
        }
    }
    
    private var saveTodoButton: some View {
        Button(action: saveTodo) {
            Text("Done")
                .fontWeight(.bold)
        }
    }
    
    private func dismiss() {
        isPresented = false
        todoTask = ""
        todoComplete = false
    }
    
    private func saveTodo() {
        let dto = TodoDTO(task: todoTask, complete: todoComplete)
        store.addTodo(dto)
        
        dismiss()
    }
}

#if DEBUG
struct AddTodoView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            AddTodoView(isPresented: .constant(true))
                .environment(\.colorScheme, .light)
            
            AddTodoView(isPresented: .constant(true))
                .environment(\.colorScheme, .dark)
            
            AddTodoView(isPresented: .constant(true))
                .previewDevice(PreviewDevice(stringLiteral: "iPhone SE"))
            
            AddTodoView(isPresented: .constant(true))
                .previewLayout(.fixed(width: 667, height: 375))
        }
        .environmentObject(AppStore(todos: []))
    }
}
#endif
