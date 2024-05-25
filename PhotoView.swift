//
//  PhptoView.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import SwiftUI

struct PhotoView: View {
    @StateObject private var photoViewModel: PhotosViewModel
    
    init(viewModel: PhotosViewModel = PhotosViewModel(service: DIContainer.shared.networkService)) {
        _photoViewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        List(photoViewModel.photosList) { item in
            HStack (spacing: 16) {
                if let url = URL(string: item.thumbnailUrl){
                    AsyncImageView(url: url)
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                        .padding(.trailing,8)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                        .padding(.trailing,8)
                }
                
                
                Text(item.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
            }
         
            
        }
        .background(Color.gray)
        .cornerRadius(10)
        .shadow(radius: 20)
        .listStyle(.grouped)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .padding(.top, 16)
        .navigationTitle("Photos")
    }
}

#Preview {
    PhotoView()
}
