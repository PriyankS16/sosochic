//
//  OutfitView.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 06/04/25.
//


import SwiftUI

struct OutfitView: View {
    @StateObject private var viewModel = OutfitViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.outfits) { outfit in
                VStack(alignment: .leading) {
                    Text("Outfit: \(outfit.name)")
                    Text("Items: \(outfit.items.joined(separator: ", "))")
                }
            }
            .navigationTitle("My Outfits")
            .onAppear {
                viewModel.loadOutfits()
            }
        }
    }
}
