//
//  CartService.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 06/04/25.
//


import Foundation
import Combine

class CartService {
    func getCartContents() -> AnyPublisher<[CartItem], Error> {
        let sampleProduct = Product(
            id: "UUID()",
            name: "Slim Fit Blazer",
            imageURL: "https://example.com/image.jpg",
            price: 199.99,
            sku: "SLIM-BLAZER-001"
        )

        let cartItems = [
            CartItem(product: sampleProduct, quantity: 1),
            CartItem(product: sampleProduct, quantity: 2)
        ]

        return Just(cartItems)
            .setFailureType(to: Error.self)
            .delay(for: .seconds(1), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
