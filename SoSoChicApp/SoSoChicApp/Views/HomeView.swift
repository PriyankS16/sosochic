//
//  HomeView.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//


import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.featuredProducts) { product in
                ProductCardView(product: product)
            }
            .navigationTitle("Featured Products")
            .onAppear {
                viewModel.fetchFeaturedProducts()
            }
        }
    }
}
