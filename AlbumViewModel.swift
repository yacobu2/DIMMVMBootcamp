//
//  AlbumViewModel.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import Foundation
import Combine

class AlbumViewModel: ObservableObject {
    @Published var albumList: [Album] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var networkService: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.networkService = service
        fetchAlbums()
    }
    
    func fetchAlbums() {
        networkService.request(endpoint: .getAlbums)
            .decode(type: [Album].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case.failure(let error) = completion {
                    print("Error fetching albums:\(error)")
                }
                
            }, receiveValue: { [weak self] albums in
                self?.albumList = albums
                
            })
            .store(in: &cancellables)
        }
    
}
