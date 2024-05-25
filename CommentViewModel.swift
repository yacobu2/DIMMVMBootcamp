//
//  CommentViewModel.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import Foundation
import Combine

class CommentViewModel: ObservableObject {
    @Published var commentList: [Comment] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var networkService: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.networkService = service
        fetchComments()
    }
    
    func fetchComments() {
        networkService.request(endpoint: .getComments)
            .decode(type: [Comment].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case.failure(let error) = completion {
                    print("Error fetching albums:\(error)")
                }
                
            }, receiveValue: { [weak self] comments in
                self?.commentList = comments
                
            })
            .store(in: &cancellables)
        }
    
}

