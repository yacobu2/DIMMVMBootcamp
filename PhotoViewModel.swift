//
//  PhotoViewModel.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import Foundation
import Combine

class PhotosViewModel: ObservableObject {
    @Published var photosList: [Photo] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var networkService: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.networkService = service
        fetchPhotos()
    }
    
    func fetchPhotos() {
        networkService.request(endpoint: .getPhotos)
            .decode(type: [Photo].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case.failure(let error) = completion {
                    print("Error fetching albums:\(error)")
                }
                
            }, receiveValue: { [weak self] photos in
                self?.photosList = photos
                
            })
            .store(in: &cancellables)
        }
    
}

