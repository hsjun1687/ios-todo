//
//  TodoListRowView.swift
//  SwiftUIStudy
//
//  Created by Infobank on 2022/06/27.
//

import SwiftUI

struct TodoListRowView: View {
    let item: Todo
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct TodoListRowView_Previews: PreviewProvider {
    static var item1 = Todo(title: "First item!", isCompleted: false)
    static var item2 = Todo(title: "Second item!", isCompleted: true)
    static var previews: some View {
        Group {
            TodoListRowView(item: item1)
            TodoListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
