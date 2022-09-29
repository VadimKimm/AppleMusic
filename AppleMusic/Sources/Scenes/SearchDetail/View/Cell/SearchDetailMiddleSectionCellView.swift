//
//  SearchDetailMiddleSectionCellView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 22.09.2022.
//

import SwiftUI

struct SearchDetailMiddleSectionCellView: View {

    var track: TrackModel

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(track.image)
                .resizable()
                .scaledToFit()
                .frame(width: Metrics.frameWidth, height: Metrics.frameHeight)
                .cornerRadius(Metrics.imageCornerRadius)
                .padding(.top, Metrics.imageTopPadding)

            VStack {
                Divider()

                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(track.song)
                            .foregroundColor(.primary)
                        Text(track.author)
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }

                    Spacer()

                    Image(systemName: "ellipsis")
                        .padding(.trailing)
                }

            }
        }
        .frame(height: Metrics.frameHeight)
    }
}

struct SearchDetailMiddleSectionCellView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailMiddleSectionCellView(track: ModelData().tracks[0])
    }
}

extension SearchDetailMiddleSectionCellView {
    enum Metrics {
        static let frameHeight: CGFloat = 50
        static let frameWidth = frameHeight
        static let imageCornerRadius: CGFloat = 6
        static let imageTopPadding: CGFloat = 5
    }
}
