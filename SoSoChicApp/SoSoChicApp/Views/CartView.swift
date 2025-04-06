//
//  CartView.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 06/04/25.
//


import SwiftUI

struct CartView: View {
    @StateObject private var viewModel = CartViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.cartItems) { item in
                VStack(alignment: .leading) {
                    Text(item.product.name)
                    Text("Qty: \(item.quantity)")
                }
            }
            .navigationTitle("Cart")
            .onAppear {
                viewModel.fetchCart()
            }
        }
    }
}
