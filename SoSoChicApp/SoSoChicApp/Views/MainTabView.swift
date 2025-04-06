//
//  MainTabView.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//


import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appState: AppStateManager

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }

            OutfitView()
                .tabItem {
                    Label("Outfits", systemImage: "figure.walk")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}
