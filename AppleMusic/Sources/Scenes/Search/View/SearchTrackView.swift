//
//  SearchTrackView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 22.09.2022.
//

import SwiftUI

struct SearchTrackView: View {

    let track: TrackModel

    var body: some View {
        HStack {
            Image(track.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(Metrics.imageCornerRadius)

            VStack(alignment: .leading) {
                Text(track.author)
                    .foregroundColor(.primary)
                Text(track.song)
                    .foregroundColor(.secondary)
                    .font(.caption)
            }

            Spacer()

            Image(systemName: "ellipsis")
        }
        .frame(height: Metrics.frameHeight)
    }
}

struct SearchTrackView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTrackView(track: ModelData().tracks[5])
    }
}

extension SearchTrackView {
    enum Metrics {
        static let imageCornerRadius: CGFloat = 8
        static let frameHeight: CGFloat = 50
    }
}

