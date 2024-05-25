//
//  CommentView.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import SwiftUI

struct CommentView: View {
    @StateObject private var commentViewModel: CommentViewModel
    
    init(viewModel: CommentViewModel = CommentViewModel(service: DIContainer.shared.networkService)) {
        _commentViewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
       
            List(commentViewModel.commentList) { comment in
                Text(comment.name)
                
            }
            .background(Color.gray)
            .cornerRadius(10)
            .shadow(radius: 20)
            .listStyle(.grouped)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.top, 16)
            .navigationTitle("Comments")
        }
    }


#Preview {
    CommentView()
}
