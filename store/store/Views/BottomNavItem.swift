//
//  BottomNavItem.swift
//  store
//
//  Created by Greylin on 4/4/25.
//

import SwiftUI

struct BottomNavItem: View {
    let icon: String
    var isSelected: Bool = false

    var body: some View {
        Button(action: {}) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(isSelected ? .black : .gray)
        }
    }
}
