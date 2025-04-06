//
//  OutfitService.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//


import Foundation
import Combine

class OutfitService {
    private var savedOutfits: [Outfit] = []

    func fetchSavedOutfits() -> AnyPublisher<[Outfit], Never> {
        // Simulate local storage for now
        let mockProduct = Product(
            id: "UUID",
            name: "Slim Jeans",
            imageURL: "https://example.com/jeans.jpg",
            price: 89.99,
            sku: "SJ001"
        )

        let sampleOutfit = Outfit(
            name: "Weekend Casual",
            items: ["Slim Jeans"],
            createdAt: Date(),
            mannequinBodyType: "Athletic",
            previewImageURL: nil
        )

        savedOutfits = [sampleOutfit]
        return Just(savedOutfits)
            .eraseToAnyPublisher()
    }

    func saveOutfit(_ outfit: Outfit) {
        savedOutfits.append(outfit)
        // Persist to disk if needed (e.g., using CoreData, FileManager, or UserDefaults)
    }
}
