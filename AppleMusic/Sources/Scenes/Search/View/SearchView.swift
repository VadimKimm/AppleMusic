//
//  SearchView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 10.09.2022.
//

import SwiftUI

struct SearchView: View {

    @State private var searchText = ""
    @State private var searchTextPlaceholder = "Ваша медиатека"
    @State private var categoryItems = SearchCategoryModel.getData()

    let columns = Array(repeating: GridItem(.flexible(), spacing: Metrics.columnsSpacing), count: 2)

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(spacing: 15) {
                        Image(systemName: "magnifyingglass")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        TextField("Ваша медиатека", text: $searchText)
                    }
                    .frame(height: 40)
                    .padding(.horizontal, Metrics.padding)
                    .background(.quaternary)
                    .cornerRadius(10)

                    Divider()

                    Text("Поиск по категориям")
                        .font(.title2)
                        .bold()

                    LazyVGrid(columns: columns) {
                        ForEach(categoryItems) { item in
                            NavigationLink {
                                Text(item.title)
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
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

extension SearchView {
    enum Metrics {
        static let padding: CGFloat = 15
        static let frameWidth: CGFloat = UIScreen.main.bounds.width / 2
        static let frameHeight: CGFloat = UIScreen.main.bounds.width / 3
        static let spacerMinLength: CGFloat = 80
        static let columnsSpacing: CGFloat = 10
    }
}
