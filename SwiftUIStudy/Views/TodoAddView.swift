//
//  TodoAddView.swift
//  SwiftUIStudy
//
//  Created by Infobank on 2022/06/27.
//

import SwiftUI

struct TodoAddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: TodoListViewModel
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                Button(action: saveButtonPressed,
                       label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add Todo")
        .alert(isPresented: $showAlert, content: alert)
    }
    
    func saveButtonPressed() {
        if isTextInputAppropriate() {
            viewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            alertTitle = "Your new todo item must be at leat 3 characters!"
            showAlert.toggle()
        }
    }
    
    func isTextInputAppropriate() -> Bool {
        return textFieldText.count >= 3
    }
    
    func alert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct TodoAddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                TodoAddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(TodoListViewModel())
            
            NavigationView {
                TodoAddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(TodoListViewModel())
        }
        
    }
}
