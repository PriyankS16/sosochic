//
//  SearchViewModel.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 06/04/25.
//


import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var query = ""
    @Published var results: [Product] = []

    private let productService = ProductService()
    private var cancellables = Set<AnyCancellable>()

    func search() {
        productService.searchProducts(query: query)
            .replaceError(with: [])
            .assign(to: &$results)
    }
}
