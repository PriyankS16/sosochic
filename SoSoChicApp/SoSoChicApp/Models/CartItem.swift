//
//  CartItem.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//


import Foundation

struct CartItem: Identifiable, Codable {
    var id: UUID = UUID()
    let product: Product
    let quantity: Int
}
