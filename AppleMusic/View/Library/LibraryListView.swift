//
//  LibraryListView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 29.08.2022.
//

import SwiftUI

struct LibraryListView: View {

    @State private var libraryItems = LibraryRow.getData()
    @State private var selectedItems = Set<UUID>()

    var body: some View {
        List(selection: $selectedItems) {
            ForEach($libraryItems) { $item in
                LibraryRowView(libraryItem: item) {
                    item.isSelected.toggle()
                }
            }
            .onMove(perform: moveItem)
        }
        .listStyle(.inset)
    }

    private func moveItem(source: IndexSet, destination: Int) {
        libraryItems.move(fromOffsets: source, toOffset: destination)
    }
}

struct LibraryListView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryListView()
    }
}
