//
//  Product.swift
//  store
//
//  Created by Greylin on 4/4/25.
//

import Foundation

struct Sneaker: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let imageName: String
    let discount: String
    var category: [String]
}
