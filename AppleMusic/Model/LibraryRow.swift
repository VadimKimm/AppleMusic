//
//  LibraryRow.swift
//  AppleMusic
//
//  Created by Vadim Kim on 29.08.2022.
//

import Foundation

struct LibraryRow: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let imageName: String
    var isSelected = false
}


extension LibraryRow {
    static func getData() -> [LibraryRow] {
        let libraryItems = [
            LibraryRow(title: "Плейлисты", imageName: "music.note.list"),
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

        return libraryItems
    }
}
