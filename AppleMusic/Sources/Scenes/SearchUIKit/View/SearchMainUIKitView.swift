//
//  SearchUIKitView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 26.09.2022.
//

import SwiftUI

struct SearchMainUIKitView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: SearchViewController()) 
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}
