//
//  LibraryRowView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 29.08.2022.
//

import SwiftUI

struct LibraryRowView: View {

    var libraryItem: LibraryRow

    var body: some View {
        HStack {
            HStack(spacing: 15) {
                Image(systemName: libraryItem.imageName)
                    .foregroundColor(.red)
                Text(libraryItem.title)
                    .font(.title3)
                    .fontWeight(.light)
            }
        }
    }
}

struct LibraryRowView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryRowView(libraryItem: LibraryRow(title: "Плейлисты", imageName: "music.mic"))
    }
}
