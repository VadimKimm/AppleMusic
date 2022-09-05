//
//  RadioView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 04.09.2022.
//

import SwiftUI

struct RadioView: View {

    let rows = [GridItem(.flexible())]
    let columns = [GridItem(.flexible())]

    @State private var topSectionRadioItems = RadioModel.getPreviewData()
    @State private var bottomSectionRadioItems = RadioModel.getStations()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Divider()

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(topSectionRadioItems) { item in
                        RadioTopSectionView(radioItem: item)
                    }
                    .frame(width: UIScreen.main.bounds.width - 16)
                }
            }

            Divider()

            LazyVGrid(columns: columns) {
                VStack(alignment: .leading) {
                    Text("Станции")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal, Metrics.padding)

                    ForEach(bottomSectionRadioItems) { item in
                        RadioBottomSectionView(radioItem: item)
                    }
                }
            }

            Spacer(minLength: Metrics.spacerMinLength)
        }
        .padding(.horizontal, Metrics.padding)
        .navigationTitle("Радио")
        .navigationViewStyle(.columns)
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}

extension RadioView {
    enum Metrics {
        static let padding: CGFloat = 8
        static let spacerMinLength: CGFloat = 70
    }
}
