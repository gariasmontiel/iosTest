//
//  CategoryView.swift
//  store
//
//  Created by Greylin on 5/4/25.
//
import SwiftUI

struct CategoriesView: View {
    //@Binding var selectedCategory: String
    @ObservedObject var viewModel: SneakerViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(
                    ["All", "Basketball" ,"Running", "Formal", "Lifestyle","Other", ],
                    id: \.self
                ) { category in
                    CategoryButton(
                        title: category,
                        isSelected: viewModel.selectedCategory == category
                    ) {
                        viewModel.selectCategory(category)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
