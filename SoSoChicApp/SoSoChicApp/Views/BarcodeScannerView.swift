//
//  BarcodeScannerView.swift
//  SoSoChicApp
//
//  Created by Priyank Saxena on 06/04/25.
//


import SwiftUI
import AVFoundation

struct BarcodeScannerView: UIViewControllerRepresentable {
    var onScanResult: (String) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(onScanResult: onScanResult)
    }

    func makeUIViewController(context: Context) -> ScannerViewController {
        let controller = ScannerViewController()
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}

    class Coordinator: NSObject, ScannerViewControllerDelegate {
        let onScanResult: (String) -> Void

        init(onScanResult: @escaping (String) -> Void) {
            self.onScanResult = onScanResult
        }

        func didFindBarcode(_ code: String) {
            onScanResult(code)
        }
    }
}
