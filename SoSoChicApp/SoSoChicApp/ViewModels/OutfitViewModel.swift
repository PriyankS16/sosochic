//
//  OutfitViewModel.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 06/04/25.
//
import Foundation
import Combine

class OutfitViewModel: ObservableObject {
    @Published var outfits: [Outfit] = []
    private var cancellables = Set<AnyCancellable>()
    private let outfitService: OutfitService

    init(outfitService: OutfitService = OutfitService()) {
        self.outfitService = outfitService
        loadOutfits()
    }

    func loadOutfits() {
        outfitService.fetchSavedOutfits()
            .sink { [weak self] outfits in
                self?.outfits = outfits
            }
            .store(in: &cancellables)
    }

    func saveOutfit(_ outfit: Outfit) {
        outfitService.saveOutfit(outfit)
        loadOutfits()
    }
}
