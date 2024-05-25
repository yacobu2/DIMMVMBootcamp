//
//  TodoViewModel.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//
import Foundation
import Combine

class TodoViewModel: ObservableObject {
    @Published var todosList: [Todo] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var networkService: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.networkService = service
        fetchTodos()
    }
    
    func fetchTodos() {
        networkService.request(endpoint: .getTodos)
            .decode(type: [Todo].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case.failure(let error) = completion {
                    print("Error fetching albums:\(error)")
                }
                
            }, receiveValue: { [weak self] todos in
                self?.todosList = todos
                
            })
            .store(in: &cancellables)
        }
    
}
