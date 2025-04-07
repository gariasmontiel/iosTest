//
//  CardViewModel.swift
//  store
//
//  Created by Greylin on 5/4/25.
//

import Combine
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var itemCount: Int = 0

    func addItem() {
        itemCount += 1
    }
}
