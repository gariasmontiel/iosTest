//
//  CategoryButton.swift
//  store
//
//  Created by Greylin on 4/4/25.
//
import SwiftUI

struct CategoryButton: View {
    let title: String
    var isSelected: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(isSelected ? .white : .gray)
                .padding()
                .background(isSelected ? Color.black : Color.clear)
                .cornerRadius(20)
        }
    }
}
