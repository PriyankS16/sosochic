//
//  AppStateManager.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//
import Foundation
import Combine

enum AppState {
    case login
    case guest
    case authenticated
}

class AppStateManager: ObservableObject {
    
    @Published var currentState: AppState = .login
    //@Published var isGuest: Bool = false

    init() {
        currentState = (KeychainManager.shared.getToken() == nil) ? .login : .authenticated
    }
    
    func loginAsGuest() {
        KeychainManager.shared.saveToken("GuestToken")
        currentState = .guest
    }
    
    func logout() {
        KeychainManager.shared.clearToken()
        currentState = .login
    }
}
