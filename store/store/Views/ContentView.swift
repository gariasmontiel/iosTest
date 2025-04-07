//
//  ContentView.swift
//  store
//
//  Created by Greylin on 4/4/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var sneakerViewModel = SneakerViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var showError = false

    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
               
                    DiscountBannerView()
                ScrollView {
                    PaginationDotsView()
         
                    CategoriesView(viewModel: sneakerViewModel)
                    
                    // ProductGridView: View
                 //   ScrollView {
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible(),spacing: 16),
                                GridItem(.flexible(), spacing: 16),
                            ],
                            spacing: 16
                        ) {
                            ForEach(sneakerViewModel.filteredSneaker) { sneaker in
                                Button(action: {
                                    sneakerViewModel.selectedProduct = sneaker
                                }) {
                                    ProductCard(
                                        sneaker: sneaker,
                                        sneakerViewModel: sneakerViewModel
                                    )
                                    .frame(maxWidth: .infinity)
                                    .aspectRatio(0.75, contentMode: .fit)
                                }
                                
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.top, 10)
                    }
                    
                    BottomNavigationView()
                }
                .background(Color.white)
                .navigationDestination(item: $sneakerViewModel.selectedProduct) {
                    sneaker in SneakerCardView(sneaker: sneaker)
                }
                .onAppear {
                    let appearance = UINavigationBarAppearance.whiteBackground()
                    UINavigationBar.appearance().standardAppearance = appearance
                    UINavigationBar.appearance().scrollEdgeAppearance = appearance
                }
                .onReceive(sneakerViewModel.$errorMessage) { error in
                    showError = error != nil
                }
                .alert(isPresented: $showError) {
                    Alert(
                        title: Text("Error"),
                        message: Text(
                            sneakerViewModel.errorMessage ?? "Unknown error"
                        ),
                        dismissButton: .default(Text("OK")) {
                            sneakerViewModel.errorMessage = nil
                        }
                    )
                }
            }
        }
    }


extension UINavigationBarAppearance {
    static func whiteBackground() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        return appearance
    }
}

struct BottomNavigationView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack(spacing: 40) {
                    BottomNavItem(icon: "house.fill", isSelected: true)
                    BottomNavItem(icon: "heart")
                    BottomNavItem(icon: "bell")
                    BottomNavItem(icon: "person")
                }
                .frame(width: geometry.size.width)
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(
                    .bottom,
                    geometry.safeAreaInsets.bottom > 0
                        ? geometry.safeAreaInsets.bottom : 20
                )
                .background(Color.white)
                .shadow(radius: 2)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .frame(height: 80)
    }
}

struct PaginationDotsView: View {
    var body: some View {
        HStack {
            ForEach(0..<4) { _ in
                Circle()
                    .fill(Color.gray)
                    .frame(width: 8, height: 8)
            }
        }
        .padding(.top)
    }
}

struct DiscountBannerView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("20% Discount")
                    .font(.title)
                    .fontWeight(.bold)
                Text("on your first purchase")
                    .foregroundColor(.gray)
                Button(action: {}) {
                    Text("Shop now")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
            }
            Spacer()
            Image("discount_shoe")
                .resizable()
                .frame(width: 150, height: 100)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .font(.title)
            Spacer()
            Image("nike_logo")
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
            Button(action: {
                // Action for cart button
            }) {
                Image(systemName: "cart")
                    .font(.title)
            }
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 2)
    }
}

#Preview {
    ContentView()
}
