//
//  ProductCard.swift
//  store
//
//  Created by Greylin on 4/4/25.
//
import SwiftUI

struct ProductCard: View {
    let sneaker: Sneaker
    @ObservedObject var sneakerViewModel: SneakerViewModel

    var body: some View {
        VStack {
            RemoteImage(url: sneaker.imageName)
                .frame(height: 120)
                .cornerRadius(12)
                .clipped()
            Text(sneaker.name)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            Text("\(sneaker.price)")
                .foregroundColor(.gray)
            Button(action: {
                sneakerViewModel.selectedProduct = sneaker
            }) {
                Image(systemName: "arrow.right")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
