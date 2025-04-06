//
//  ProfileView.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 06/04/25.
//


import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppStateManager

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("User Info")) {
                    Text("Email: User")
                }

                Section {
                    Button("Logout") {
                        appState.logout()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Profile")
        }
    }
}
