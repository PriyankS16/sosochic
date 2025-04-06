//
//  CartViewModel.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//


import Foundation
import Combine

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []

    private let cartService = CartService()

    func fetchCart() {
        cartService.getCartContents()
            .replaceError(with: [])
            .assign(to: &$cartItems)
    }
}
