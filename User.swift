//
//  User.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import Foundation


    struct User: Codable,Identifiable {
        let id: Int
        let name: String
        let username: String
        let email: String
        static let userMockData: [User] = [User(id: 1, name: "Eric", username: "Eric-Edward", email: "eric.edward@gmail.com")]
    }

    
    

