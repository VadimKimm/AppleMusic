//
//  MainView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 29.08.2022.
//

import SwiftUI

struct MainView: View {
    
    @State var isSearchBarActive = false
    
    var body: some View {
        ZStack {
            TabView {
                LibraryView()
                    .tabItem {
                        Image(systemName: "music.note")
                        Text("Медиатека")
                    }
                
                NavigationView {
                    RadioView()
                }
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Радио")
                }
                
                SearchView(isSearchBarActive: $isSearchBarActive)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                    }

                SearchMainUIKitView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск UIKit")
                    }
            }
            .accentColor(.red)
            .safeAreaInset(edge: .bottom) {
                if !isSearchBarActive {
                    PlayerView()
                        .offset(y: Metrics.PlaybackViewYOffset)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// MARK: - Metrics

extension MainView {
    enum Metrics {
        static let PlaybackViewYOffset: CGFloat = -47
    }
}
