//
//  Album.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import Foundation

struct Album: Identifiable,Codable {
   let userId: Int
   let id: Int
   let title: String
    
    static let albumsMockData: [Album] = [Album(userId: 1, id: 1, title: "quidem molestiae enim")]
}
