//
//  ProductCardView.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 05/04/25.
//


import SwiftUI

struct ProductCardView: View {
    let product: Product

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable().frame(width: 80, height: 100)
                case .failure:
                    Image(systemName: "xmark.octagon")
                @unknown default:
                    EmptyView()
                }
            }
            VStack(alignment: .leading) {
                Text(product.name).font(.headline)
                Text("$\(product.price, specifier: "%.2f")").font(.subheadline)
            }
        }
    }
}
