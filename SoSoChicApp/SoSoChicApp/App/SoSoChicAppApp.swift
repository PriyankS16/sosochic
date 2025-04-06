//
//  SoSoChicAppApp.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//

import SwiftUI

@main
struct SoSoChicApp: App {
    @StateObject private var appState = AppStateManager()

    var body: some Scene {
        WindowGroup {
            AppRouter()
                .environmentObject(appState)
        }
    }
}
