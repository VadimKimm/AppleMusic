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
    @State private var selectedSearchTag = 0
    @State private var searchPlaceholder = "Ваша медиатека"

    var body: some View {
        NavigationView {
            SearchInitialView(model: model)
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: $searchPlaceholder.wrappedValue) {
            
            SearchPickerView(selectedSearchTag: $selectedSearchTag,
                             searchText: $searchText,
                             searchPlaceholder: $searchPlaceholder,
                             model: model)
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
