//
//  PostViewModel.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//


import Foundation
import Combine

class PostViewModel: ObservableObject {
    @Published var postList: [Post] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var networkService: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.networkService = service
        fetchPosts()
    }
    
    func fetchPosts() {
        networkService.request(endpoint: .getPosts)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case.failure(let error) = completion {
                    print("Error fetching albums:\(error)")
                }
                
            }, receiveValue: { [weak self] posts in
                self?.postList = posts
                
            })
            .store(in: &cancellables)
        }
    
}
