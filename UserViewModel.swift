//
//  UserViewModel.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var userList: [User] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var networkService: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.networkService = service
        fetchUsers()
    }
    
    func fetchUsers() {
        networkService.request(endpoint: .getUsers)
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case.failure(let error) = completion {
                    print("Error fetching albums:\(error)")
                }
                
            }, receiveValue: { [weak self] users in
                self?.userList = users
                
            })
            .store(in: &cancellables)
        }
    
}
