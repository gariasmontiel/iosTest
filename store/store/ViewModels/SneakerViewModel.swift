//
//  SneakerViewModel.swift
//  store
//
//  Created by Greylin on 4/4/25.
//

import Combine
import Foundation

class SneakerViewModel: ObservableObject {
    @Published var sneakers: [Sneaker] = []
    //@Published var sneakersData: [SneakerData] = []
    private var cancellable = Set<AnyCancellable>()
    @Published var selectedProduct: Sneaker?
    @Published var selectedCategory: String = "All"
    private let apiService: SneakerAPIServiceProtocol
    @Published var errorMessage: String?

    @Published var filteredSneaker: [Sneaker] = []

    init(apiService: SneakerAPIServiceProtocol = SneakerAPIService()) {
        self.apiService = apiService
        fetchSneakers()
    }

    func selectCategory(_ category: String) {
        selectedCategory = category
        filterSneakers(category: selectedCategory)
    }

    func fetchSneakers() {
        apiService.fetchSneakers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let sneakersResponse):
                    self?.sneakers = sneakersResponse.sneakers
                    self?.filteredSneaker = sneakersResponse.sneakers
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func filterSneakers(category: String) {
        if category == "All" {
            filteredSneaker = sneakers
        } else {
            filteredSneaker = sneakers.filter { $0.category.contains(category.lowercased()) }
        }
    }
}
