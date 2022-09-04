//
//  RadioBottomSectionView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 04.09.2022.
//

import SwiftUI

struct RadioBottomSectionView: View {

    let radioItem: RadioModel

    var body: some View {
        VStack(alignment: .leading) {

            HStack(alignment: .center, spacing: Metrics.hStackSpacing) {
                Image(radioItem.stationImageName ?? "raplife")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(Metrics.imageCornerRadius)

                VStack(alignment: .leading) {
                    Text(radioItem.title)

                    Text(radioItem.subtitle)
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
            }
            .padding(.horizontal, Metrics.padding)
            
            Divider()
            
        }
    }
}

struct RadioBottomSectionView_Previews: PreviewProvider {
    static var previews: some View {
        RadioBottomSectionView(radioItem: RadioModel.getStations()[0])
    }
}

extension RadioBottomSectionView {
    enum Metrics {
        static let imageCornerRadius: CGFloat = 10
        static let hStackSpacing: CGFloat = 20
        static let padding: CGFloat = 8
    }
}
