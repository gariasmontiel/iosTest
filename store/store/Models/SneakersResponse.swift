//
//  SneakersResponse.swift
//  store
//
//  Created by Greylin on 5/4/25.
//

import Foundation

struct HealthCheck: Codable {
    let message: String
}

struct SneakersResponse: Codable {
    let healthcheck: HealthCheck
    let sneakers: [Sneaker]
}

protocol SneakerAPIServiceProtocol {
    func fetchSneakers(completion: @escaping (Result<SneakersResponse, Error>) -> Void) 
}
