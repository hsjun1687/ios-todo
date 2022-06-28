//
//  Todo.swift
//  SwiftUIStudy
//
//  Created by Infobank on 2022/06/27.
//

import Foundation

struct Todo: Identifiable, Codable {
    let id: String
    let title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString,
         title: String,
         isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toggleCompletion() -> Todo {
        return Todo(id: id, title: title, isCompleted: !isCompleted)
    }
}
