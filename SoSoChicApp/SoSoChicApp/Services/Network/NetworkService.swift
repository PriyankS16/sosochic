//
//  NetworkService.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//
import SwiftUI

import Foundation
import Combine

class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(urlReq: URLRequest) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: urlReq.url!)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

