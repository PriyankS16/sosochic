//
//  LoginView.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppStateManager
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("So So Chic")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }

            Button("Login") {
                viewModel.login()
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isLoading)
            
            Divider().padding(.vertical)
            
            Button("Guest Login") {
                appState.loginAsGuest()
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isLoading)

            Spacer()
        }
        .padding()
    }
}
