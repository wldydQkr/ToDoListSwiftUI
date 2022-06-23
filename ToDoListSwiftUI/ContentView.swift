//
//  ContentView.swift
//  ToDoListSwiftUI
//
//  Created by 박지용 on 2022/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var presentAlert = false
    @State private var toDo: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Text("ToDoList")
            }
            .navigationBarTitle(Text("ToDoList"))
            .navigationBarItems(
                leading:
                    Button(
                        action: {},
                        label: {
                            Image(systemName: "pencil.circle")
                        }
                    ),
                trailing:
                    Button(
                        action: {
                            self.presentAlert = true
                        },
                        label: {
                            Image(systemName: "plus.circle")
                        }
                    )
                    .alert("할 일 추가", isPresented: $presentAlert, actions: {
                        TextField("할 일을 입력해주세요", text: $toDo) // iOS 16 부터 지원..

                        Button("추가", action: {})
                        Button("취소", role: .cancel, action: {})
                    })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
