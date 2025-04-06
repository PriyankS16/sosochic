//
//  NetworkServiceProtocol.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//


import Foundation
import Combine

protocol NetworkServiceProtocol {
    func request<T: Decodable>(urlReq: URLRequest) -> AnyPublisher<T, Error>
}
