//
//  AuthService.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 06/04/25.
//


import Foundation
import Combine

protocol AuthServicing {
    func login(email: String, password: String) -> AnyPublisher<String, Error>
}

class AuthService: AuthServicing {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func login(email: String, password: String) -> AnyPublisher<String, Error> {
        var request = URLRequest(url: URL(string: "https://api.sosochic.com/login")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["email": email, "password": password]
        request.httpBody = try? JSONEncoder().encode(body)

        return networkService
            .request(urlReq: request)
            .map { (response: LoginResponse) in
                response.token
            }
            .eraseToAnyPublisher()
    }
}
struct LoginResponse: Codable {
    let token: String
}
