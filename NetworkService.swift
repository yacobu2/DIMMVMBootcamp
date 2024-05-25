//
//  NetworkService.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import Foundation

import Combine

protocol NetworkServiceProtocol {
    func request(endpoint: APIEndpoint) -> AnyPublisher<Data, URLError>
}

enum APIEndpoint: String {
    case getUsers = "/users"
    case getPosts = "/posts"
    case getComments = "/comments"
    case getAlbums = "/albums"
    case getPhotos = "/photos"
    case getTodos = "/todos"
 
}

class NetworkService: NetworkServiceProtocol, ObservableObject {
    private let baseUrl = "https://jsonplaceholder.typicode.com"
    
    func request(endpoint: APIEndpoint) -> AnyPublisher < Data, URLError> {
        guard let url = URL(string: baseUrl + endpoint.rawValue) else {fatalError()}
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
    
    
}
