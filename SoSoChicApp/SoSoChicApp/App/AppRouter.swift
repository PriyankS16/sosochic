//
//  AppRouter.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//


import SwiftUI

struct AppRouter: View {
    @EnvironmentObject var appState: AppStateManager

    var body: some View {
        if appState.currentState == .authenticated || appState.currentState == .guest {
            MainTabView()
                .environmentObject(appState)
        } else {
            LoginView()
                .environmentObject(appState)
        }
    }
}
