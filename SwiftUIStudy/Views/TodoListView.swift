//
//  TodoListView.swift
//  SwiftUIStudy
//
//  Created by Infobank on 2022/06/27.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var viewModel: TodoListViewModel
    
    var body: some View {
        ZStack {
            if viewModel.items.isEmpty {
                TodoNoItemsView()
            } else {
                List {
                    ForEach(viewModel.items) { item in
                        TodoListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    viewModel.updateItem(item: item.toggleCompletion())
                                }
                            }
                    }
                    .onDelete(perform: viewModel.deleteItem)
                    .onMove(perform: viewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("TodoList")
        .navigationBarItems(leading: viewModel.items.isEmpty ? nil : EditButton(),
                            trailing: NavigationLink("Add",
                                                     destination: TodoAddView()))
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoListView()
        }
        .environmentObject(TodoListViewModel())
    }
}

