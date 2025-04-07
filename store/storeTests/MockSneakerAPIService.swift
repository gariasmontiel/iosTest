//
//  MockSneakerAPIService.swift
//  store
//
//  Created by Mario Segura on 6/4/25.
//

import Foundation
import Combine


class MockSneakerAPIService{
    var shouldReturnError = false
    var sneakersResponse: SneakersResponse?

    func fetchSneakers(completion: @escaping (Result<SneakersResponse, Error>) -> Void) {
            if shouldReturnError {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Test error"])))
            } else if let response = sneakersResponse {
                completion(.success(response))
            }
        }
}

