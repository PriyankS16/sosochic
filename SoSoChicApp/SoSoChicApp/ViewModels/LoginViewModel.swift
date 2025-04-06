//
//  LoginViewModel.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//
import Foundation
import Combine
import SwiftUICore

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isLoading = false
    @EnvironmentObject var appState: AppStateManager

    private var cancellables = Set<AnyCancellable>()
    private let authService: AuthServicing
    //private let appState: AppStateManager

    init(authService: AuthServicing = AuthService()) {
        self.authService = authService
        //self.appState = appState
    }

    func login() {
        guard validate() else { return }

        isLoading = true
        authService.login(email: email, password: password)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] token in
                KeychainManager.shared.saveToken(token)
                self?.appState.currentState = .authenticated
            })
            .store(in: &cancellables)
    }

    func continueAsGuest() {
        if appState != nil {
            print("\(appState)");
                appState.loginAsGuest()
        }
        }
    
    
    private func validate() -> Bool {
        if email.isEmpty || password.isEmpty {
            errorMessage = "Email and password are required."
            return false
        }
        return true
    }
}

