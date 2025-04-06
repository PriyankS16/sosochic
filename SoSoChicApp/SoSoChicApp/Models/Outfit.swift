//
//  Outfit.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 06/04/25.
//


import Foundation

struct Outfit: Identifiable, Codable {
    var id: UUID = UUID()
    let name: String
    let items: [String]
    let createdAt: Date
    let mannequinBodyType: String
    let previewImageURL: String? // Can be local or remote
}
