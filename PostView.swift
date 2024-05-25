//
//  PostView.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import SwiftUI

struct PostView: View {
    @StateObject private var viewModel: PostViewModel
    
    init(viewModel: PostViewModel = PostViewModel(service: DIContainer
        .shared.networkService)){
            _viewModel = StateObject(wrappedValue: viewModel)
        }
    var body: some View {
        
            List(viewModel.postList){ post in
                Text(post.title)
                
            }
            .background(Color.gray)
            .cornerRadius(10)
            .shadow(radius: 20)
            .listStyle(.grouped)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.top, 16)
            .navigationTitle("Posts")
        }
    }


#Preview {
    PostView()
}
