//
//  Comment.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import Foundation
struct Comment: Codable, Identifiable {
   
    let id: Int
    let postId: Int
    let name: String
    let email: String
    let body: String
    
    static let commentMockData:[Comment] = [Comment(id: 1, postId: 1, name: "id labore ex et quam laborum", email: "Eliseo@gardner.biz", body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium")]
}
