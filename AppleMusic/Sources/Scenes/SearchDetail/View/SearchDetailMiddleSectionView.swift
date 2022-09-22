//
//  SearchDetailMiddleSectionView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 22.09.2022.
//

import SwiftUI

struct SearchDetailMiddleSectionView: View {
    
    let model: ModelData
    let rows = [
        GridItem(.fixed(51)),
        GridItem(.fixed(51))
    ]

    var body: some View {
        VStack {
            SearchDetailHeaderView(title: "Лучшие новые треки")

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(model.tracks) { item in
                        SearchDetailMiddleSectionCellView(track: item)
                    }
                    .frame(width: Metrics.frameWidth, height: Metrics.frameHeight)
                }
            }
            .padding(.horizontal, Metrics.padding)
        }
    }
}

struct SearchDetailMiddleSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailMiddleSectionView(model: ModelData())
    }
}

extension SearchDetailMiddleSectionView {
    enum Metrics {
        static let frameWidth: CGFloat = UIScreen.main.bounds.width - 16
        static let frameHeight: CGFloat = 40
        static let padding: CGFloat = 8
    }
}
