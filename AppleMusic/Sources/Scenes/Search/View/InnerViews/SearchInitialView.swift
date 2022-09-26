//
//  SearchInitialView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 26.09.2022.
//

import SwiftUI

struct SearchInitialView: View {

    @State var model: ModelData

    let columns = [
        GridItem(.flexible(), spacing: Metrics.columnsSpacing),
        GridItem(.flexible(), spacing: Metrics.columnsSpacing)
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Divider()

                Text("Поиск по категориям")
                    .font(.title2)
                    .bold()

                LazyVGrid(columns: columns) {
                    ForEach(model.searchCategories) { item in
                        NavigationLink {
                            SearchDetailView(model: model, title: item.title)
                        } label: {
                            SearchCategoryView(categoryItem: item)
                        }
                    }
                    .frame(width: Metrics.frameWidth, height: Metrics.frameHeight)
                }
            }
            .padding(.horizontal, Metrics.padding)

            Spacer(minLength: Metrics.spacerMinLength)
        }
        .navigationTitle("Поиск")
        .navigationBarTitleDisplayMode(.large)
    }
}

extension SearchInitialView {
    enum Metrics {
        static let padding: CGFloat = 15
        static let frameWidth: CGFloat = UIScreen.main.bounds.width / 2
        static let frameHeight: CGFloat = UIScreen.main.bounds.width / 3
        static let spacerMinLength: CGFloat = 80
        static let columnsSpacing: CGFloat = 10
    }
}
