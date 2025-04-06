//
//  HomeViewModel.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 06/04/25.
//


import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var featuredProducts: [Product] = []
    private let productService = ProductService()

    func fetchFeaturedProducts() {
//        productService.fetchFeaturedProducts()
//            .replaceError(with: [])
//            .assign(to: &$featuredProducts)
        productService.getSampleFeaturedProducts()
            .replaceError(with: [])
            .assign(to: &$featuredProducts)
    }
}
