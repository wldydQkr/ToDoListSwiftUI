//
//  ContentView.swift
//  ToDoListSwiftUI
//
//  Created by 박지용 on 2022/06/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var presentAlert = false
    @State private var toDo: String = ""
    
    @ObservedObject var toDoViewModel = ToDoViewModel()
    @State private var isImportant: Bool = false
    
    struct ImportantToDo: ViewModifier {
        var importantTodoColor = Color.pink
        
        func body(content: Content) -> some View {
            return content
                .padding(.vertical, 5)
                .foregroundColor(importantTodoColor)
        }
    }
    
    var addButton: some View {
        HStack{
            Button(action: { isImportant.toggle() }, label: {
                Image(systemName: "exclamationmark.circle.fill")
                    .foregroundColor(Color.red)
            })
            TextField("할 일을 입력해 주세요", text: self.$toDo)
                .padding(6)
                .background(RoundedRectangle(cornerRadius: 7.5).fill(isImportant ? Color.red : Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.10)))
            
            Button(action: {
                toDoViewModel.addNew(toDo, isImportant)
                toDo = ""
                isImportant = false
            }, label: {
                Image(systemName: "plus.circle.fill")
                //                        .foregroundColor(Color.red)
            })
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                addButton
                    .padding(10)
                List {
                    ForEach(self.toDoViewModel.todos) { todo in
                        HStack{
                            Button(action: {
                                toDoViewModel.modifyTodoDone(todo.id)
                            }, label: {
                                Image(systemName: todo.done ? "largecircle.fill.circle" : "circle")
                                    .foregroundColor(Color.gray)
                            })
                            
                            Text(todo.todoItem)
                                .modifier(todo.done ? ImportantToDo(importantTodoColor: Color.gray) : (todo.important ? ImportantToDo() : ImportantToDo(importantTodoColor: Color.primary)))
                        }
                    }
                    .onMove(perform: self.toDoViewModel.move)
                    .onDelete(perform: self.toDoViewModel.delete)
                }
            }
            .navigationBarTitle(Text("ToDoList"))
            .navigationBarItems(
                leading:
                    EditButton(),
                trailing:
                    Button(
                        action: {
                            self.presentAlert = true
                        },
                        label: {
                            Image(systemName: "plus.circle")
                        }
                    )
                //                    .alert("할 일 추가", isPresented: $presentAlert, actions: {
                //                        TextField("할 일을 입력해주세요", text: $toDo) // iOS 16 부터 지원..
                //
                //                        Button("추가", action: {})
                //                        Button("취소", role: .cancel, action: {})
                //                    })
            )
        }
        .onAppear(perform: toDoViewModel.loadTodos)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
