//
//  ProductService.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//


import Foundation
import Combine

class ProductService {
    private let networkService: NetworkServiceProtocol
    private let tempImage = "https://image.hm.com/assets/hm/f3/3e/f33e0ea0ed8213a46aef6a6e58fcfbc468f442fc.jpg?imwidth=1536"

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    func fetchFeaturedProducts() -> AnyPublisher<[Product], Error> {
        let url = URLRequest(url: URL(string: "https://api.sosochic.com/featured")! )
        return networkService.request(urlReq: url)
    }

    func searchProducts(query: String) -> AnyPublisher<[Product], Error> {
        var components = URLComponents(string: "https://api.sosochic.com/search")!
        components.queryItems = [URLQueryItem(name: "q", value: query)]
        let url = components.url!
        let urlreq = URLRequest(url: url)
        return networkService.request(urlReq: urlreq)
    }
    
    func getSampleFeaturedProducts() -> AnyPublisher<[Product], Never>{
        //Sample Products
        let mockProduct1 = Product(
            id: "UUID",
            name: "Slim Jeans",
            imageURL: tempImage,
            price: 89.99,
            sku: "SJ001"
        )
        let mockProduct2 = Product(
            id: "UUID",
            name: "Slim Jeans",
            imageURL: tempImage,
            price: 89.99,
            sku: "SJ001"
        )
        let mockProduct3 = Product(
            id: "UUID",
            name: "Slim Jeans",
            imageURL: tempImage,
            price: 89.99,
            sku: "SJ001"
        )
        let mockProduct4 = Product(
            id: "UUID",
            name: "Slim Jeans",
            imageURL: tempImage,
            price: 89.99,
            sku: "SJ001"
        )
        let mockProduct5 = Product(
            id: "UUID",
            name: "Slim Jeans",
            imageURL: tempImage,
            price: 89.99,
            sku: "SJ001"
        )
        let mockProduct6 = Product(
            id: "UUID",
            name: "Slim Jeans",
            imageURL: tempImage,
            price: 89.99,
            sku: "SJ001"
        )
        return Just([mockProduct1, mockProduct2, mockProduct3, mockProduct4, mockProduct5,mockProduct6])
            .eraseToAnyPublisher()
    }
    
}

