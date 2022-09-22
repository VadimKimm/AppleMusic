//
//  SearchView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 10.09.2022.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var isSearchBarActive: Bool
    @ObservedObject private var model = ModelData()
    @State private var searchText = ""
    @State private var selectedSearch = 1
    @State private var searchPlaceholder = "Ваша медиатека"

    let columns = [
        GridItem(.flexible(), spacing: Metrics.columnsSpacing),
        GridItem(.flexible(), spacing: Metrics.columnsSpacing)
    ]
    

    var body: some View {
        NavigationView {
            ScrollView {
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
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: $searchPlaceholder.wrappedValue) {

                VStack(alignment: .leading) {
                    Picker("SearchSource", selection: $selectedSearch) {
                        Text("Apple Music").tag(0)
                        Text("Ваша медиатека").tag(1)
                    }
                    .onChange(of: selectedSearch) { tag in
                        if tag == 0 {
                            searchPlaceholder = "Артисты, песни, тексты и др."
                        } else {
                            searchPlaceholder = "Ваша медиатека"
                        }
                    }
                    .pickerStyle(.segmented)
                }

                if searchText.isEmpty {
                    ForEach(model.tracks) { result in
                        SearchTrackView(track: result) }
                } else {
                    ForEach(model.tracks.filter { $0.song.contains(searchText) || $0.author.contains(searchText)  }) { result in
                        SearchTrackView(track: result)
                    }
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
            isSearchBarActive = true
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
            isSearchBarActive = false
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isSearchBarActive: .constant(false))
            .previewInterfaceOrientation(.portrait)
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
