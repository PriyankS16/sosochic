//
//  LoginViewModelTests.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//


import XCTest
@testable import SoSoChicApp
import Combine

class LoginViewModelTests: XCTestCase {
    func testLoginSuccess() {
        let mockService = MockAuthService()
        let appState = AppStateManager()
        let viewModel = LoginViewModel(authService: mockService)

        viewModel.email = "test@example.com"
        viewModel.password = "password123"
        viewModel.login()

        XCTAssertTrue(appState.currentState == .authenticated)
    }

    func testLoginValidationFailure() {
        let viewModel = LoginViewModel(authService: MockAuthService())
        viewModel.login()
        XCTAssertEqual(viewModel.errorMessage, "Email and password are required.")
    }
}

class MockAuthService: AuthServicing {
    func login(email: String, password: String) -> AnyPublisher<String, Error> {
        return Just("mock-token")
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
