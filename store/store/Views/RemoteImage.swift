//
//  RemoteImage.swift
//  store
//
//  Created by Greylin on 5/4/25.
//
import SwiftUI

struct RemoteImage: View {
    @State private var image: UIImage? = nil
    let url: String
    var onImageLoaded: ((UIImage?) -> Void)?
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            loadImage()

        }
    }

    private func loadImage() {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) {
            data,
            response,
            error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImage
                    self.onImageLoaded?(uiImage)

                }
            }
        }
        task.resume()
    }
}
