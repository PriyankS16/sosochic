//
//  SearchView.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 06/04/25.
//


import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var isShowingScanner = false
    @State private var scannedCode: String?
    
    var body: some View {
        VStack {
            TextField("Search for products", text: $viewModel.query)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Search") {
                viewModel.search()
            }

            List(viewModel.results) { product in
                ProductCardView(product: product)
            }
            Button(action: {
                isShowingScanner = true
            }) {
                Label("Scan Barcode", systemImage: "barcode.viewfinder")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            if let code = scannedCode {
                Text("Scanned Code: \(code)")
                    .padding()
            }
            Spacer()
        }
        .navigationTitle("Search")
        .sheet(isPresented: $isShowingScanner) {
            BarcodeScannerView { result in
                scannedCode = result
                isShowingScanner = false
            }
        }
    }
}
