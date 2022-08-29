//
//  LibraryListView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 29.08.2022.
//

import SwiftUI

struct LibraryListView: View {

    @State private var libraryItems = [
        LibraryRow(title: "Плейлисты", imageName: "music.note.list", isSelected: true),
        LibraryRow(title: "Артисты", imageName: "music.mic"),
        LibraryRow(title: "Альбомы", imageName: "rectangle.stack.fill"),
        LibraryRow(title: "Телешоу и фильмы", imageName: "tv"),
        LibraryRow(title: "Видеоклипы", imageName: "music.note.tv"),
        LibraryRow(title: "Жанры", imageName: "guitars"),
        LibraryRow(title: "Сборники", imageName: "person.2.crop.square.stack"),
        LibraryRow(title: "Авторы", imageName: "music.quarternote.3"),
        LibraryRow(title: "Загружено", imageName: "arrow.down.circle"),
        LibraryRow(title: "Домашняя коллекция", imageName: "music.note.house")
    ]

    var body: some View {
        List {
            ForEach(libraryItems) { item in
                LibraryRowView(libraryItem: item)
            }
            .onMove(perform: moveItem)
        }
        .listStyle(.plain)
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
