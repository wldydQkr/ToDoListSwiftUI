//
//  TabView.swift
//  ToDoListSwiftUI
//
//  Created by 박지용 on 2022/06/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("First")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Second")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
