//
//  ContentView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 29.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            TabView {
                LibraryView()
                    .tabItem {
                        Image(systemName: "music.note")
                        Text("Медиатека")
                    }

                Text("Радио")
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Радио")
                    }

                Text("Поиск")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                    }
            }
            .accentColor(.red)

            PlaybackView()
                .offset(y: Metrics.PlaybackViewYOffset)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Metrics

extension ContentView {
    enum Metrics {
        static let PlaybackViewYOffset: CGFloat = -50
    }
}
