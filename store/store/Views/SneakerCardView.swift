//
//  ContentView.swift
//  store
//
//  Created by Greylin on 4/4/25.
//

import SwiftUI


struct SneakerCardView: View {
    @State private var selectedSize: String = "UK 7"
    let sneaker: Sneaker
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        ScrollView {
            VStack {
                RemoteImage(url: sneaker.imageName)
                    .frame(height: 300)
                    .padding()

                SizeSelection(selectedSize: $selectedSize)
                ColorSelection()
                Pricing(_product: sneaker)
                AddToCartButton {
                    cartViewModel.addItem()
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)

        }
        .navigationTitle(sneaker.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "cart")
                        .font(.title3)
                    Text(
                        "\(cartViewModel.itemCount)" != "0"
                            ? "\(cartViewModel.itemCount)" : ""
                    )
                    .font(.caption)
                    .padding(.leading, 5)
                }
            }
        }
        .background(Color.white)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct SizeSelection: View {

    @Binding var selectedSize: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Size")
                .font(.headline)
            HStack {
                ForEach(["UK 6", "UK 7", "UK 8", "UK 9"], id: \.self) { size in
                    Button(action: {
                        selectedSize = size
                    }) {
                        Text(size)
                            .padding()
                            .background(
                                selectedSize == size
                                    ? Color.gray.opacity(0.3) : Color.clear
                            )
                            .cornerRadius(5)
                    }
                }
            }
        }
    }
}

struct ColorSelection: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Colour")
                .font(.headline)
            HStack {
                ColorButton(color: .red)
                ColorButton(color: .blue)
            }
        }
    }
}

struct ColorButton: View {
    var color: Color

    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 30, height: 30)
            .overlay(Circle().stroke(Color.black, lineWidth: 1))
            .padding(5)
    }
}

struct Pricing: View {
    let _product: Sneaker
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(_product.price)")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("10% OFF")
                .foregroundColor(.red)
        }
    }
}

struct AddToCartButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            Text("Add")
                .font(.headline)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
        }
    }
}

struct ShoeCardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {

        }
    }
}
