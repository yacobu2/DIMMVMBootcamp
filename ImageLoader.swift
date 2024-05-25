//
//  ImageLoader.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    
    func load(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    deinit {
        cancellable?.cancel()
    }
}

struct AsyncImageView: View {
    @StateObject private var loader = ImageLoader()
    let url: URL
    let planceholder: Image
    
    init(url: URL, placeholder: Image = Image(systemName: "photo")) {
        self.url = url
        self.planceholder = placeholder
    }
    var body: some View {
       imageView
            .onAppear {
                loader.load(from: url)
            }
    }
    
    private var imageView: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
            }else {
                planceholder
                    .resizable()
            }
        }
    }
}
