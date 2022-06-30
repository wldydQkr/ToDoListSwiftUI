//
//  ToDoListSwiftUIApp.swift
//  ToDoListSwiftUI
//
//  Created by 박지용 on 2022/06/21.
//

import SwiftUI

@main
struct ToDoListSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .accentColor(.orange)
        }
    }
}
