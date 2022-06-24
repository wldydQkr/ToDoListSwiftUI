//
//  ToDO.swift
//  ToDoListSwiftUI
//
//  Created by 박지용 on 2022/06/23.
//

import Foundation

struct Todo: Identifiable, Codable{
    var id = UUID()
    let todoItem: String
    let important: Bool
    var done: Bool = false
}

