//
//  UserView.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

class DIContainer {
    static let shared = DIContainer()
    let networkService: NetworkServiceProtocol
    private init() {
        self.networkService = NetworkService()
    }
}

import SwiftUI
struct UserView: View {
    @StateObject private var viewModel: UserViewModel
    
    init(viewModel: UserViewModel = UserViewModel(service: DIContainer
        .shared.networkService)){
            _viewModel = StateObject(wrappedValue: viewModel)
        }
    var body: some View {
        
        List(viewModel.userList) { user in
            Text(user.name)
            
        }
        .background(Color.gray)
        .cornerRadius(10)
        .shadow(radius: 20)
        .listStyle(.grouped)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .padding(.top, 16)
       
        .navigationTitle("Users")
        
    }
    
}

#Preview {
    UserView()
}
