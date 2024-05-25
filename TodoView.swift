//
//  TodoView.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import SwiftUI

struct TodoView: View {
    @StateObject private var todoViewModel: TodoViewModel
    
    init(viewModel: TodoViewModel = TodoViewModel(service: DIContainer.shared.networkService)) {
        _todoViewModel = StateObject(wrappedValue: viewModel)
    }
    
    
    var body: some View {
        List(todoViewModel.todosList) { todoList in
            HStack {
                Text(todoList.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                Spacer()
                if todoList.completed {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                } else {
                    Image(systemName: "circle")
                        .foregroundStyle(.red)
                }
                
            }
          
            
        }
        
        .background(Color.gray)
        .cornerRadius(10)
        .shadow(radius: 20)
        .listStyle(.grouped)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .padding(.top, 16)
        .navigationTitle("Todo's")
    }
}

#Preview {
    TodoView()
}
