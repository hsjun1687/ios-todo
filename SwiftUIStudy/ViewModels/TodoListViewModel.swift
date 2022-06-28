//
//  TodoListViewModel.swift
//  SwiftUIStudy
//
//  Created by Infobank on 2022/06/27.
//

import Foundation

/*
 CRUD Functions for Todo
 
 Create
 Read
 Update
 Delete
 */
class TodoListViewModel: ObservableObject {
    @Published var items: [Todo] = [] {
        didSet {
            saveItems()
        }
    }
    private let itemsKey = "todo_list_item_key"
    
    init() {
        getItems()
    }
    
    func addItem(title: String) {
        items.append(Todo(title: title,
                          isCompleted: false))
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func updateItem(item: Todo) {
        guard let index = items.firstIndex(where: {$0.id == item.id}) else { return }
        items[index] = item
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let savedItems = try? JSONDecoder().decode([Todo].self, from: data) else { return }
        
        items = savedItems
    }
    
}
