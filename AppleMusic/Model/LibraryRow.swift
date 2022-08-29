//
//  LibraryRow.swift
//  AppleMusic
//
//  Created by Vadim Kim on 29.08.2022.
//

import Foundation

struct LibraryRow: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    var isSelected = false
}
