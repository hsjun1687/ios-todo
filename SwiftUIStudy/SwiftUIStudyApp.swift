//
//  SwiftUIStudyApp.swift
//  SwiftUIStudy
//
//  Created by Infobank on 2022/06/27.
//

import SwiftUI
/*
 MVVM Architecture
 
 Model      - data
 View       - UI
 ViewModel  - manges Models for View
 */
@main
struct SwiftUIStudyApp: App {
    @StateObject var todoListViewModel: TodoListViewModel = TodoListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoListView()
            }
            .navigationViewStyle(.stack)
            .environmentObject(todoListViewModel)
        }
    }
}
