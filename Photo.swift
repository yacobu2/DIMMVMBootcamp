//
//  Photo.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import Foundation

struct Photo: Codable, Identifiable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
}
