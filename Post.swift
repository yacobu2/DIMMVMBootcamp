//
//  Post.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import Foundation
struct Post: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
    
    static let postMockData:[Post] = [Post(id: 1, userId: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")]
}
