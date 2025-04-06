//
//  Product.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//
import Foundation

struct Product: Codable, Identifiable {
    let id: String
    let name: String
    let imageURL: String
    let price: Double
    let sku: String
}
