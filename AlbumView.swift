//
//  AlbumView.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import SwiftUI


struct AlbumView: View {
    @StateObject private var viewModel: AlbumViewModel
    
    init(viewModel: AlbumViewModel = AlbumViewModel(service: DIContainer.shared.networkService)) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
     
            List(viewModel.albumList) { album in
                Text(album.title)
                
            }
            .background(Color.gray)
            .cornerRadius(10)
            .shadow(radius: 20)
            .listStyle(.grouped)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.top, 16)
            .navigationTitle("Albums")
        }
    }


#Preview {
    AlbumView()
}
