//
//  LibraryView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 27.08.2022.
//

import SwiftUI

struct LibraryView: View {
    @State var isEditMode = false

    var body: some View {
        NavigationView {
            TabView {
                ZStack {
                    if isEditMode {
                        LibraryListView()
                    } else {
                        VStack {
                            Text("Ищете свою музыку?")
                                .font(.title2)
                                .bold()

                            Text("Здесь появится купленная Вами в\n iTunes Store музыка.")
                                .font(.callout)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }

                        PlaybackView()
                    }
                }
                .tabItem {
                    Image(systemName: "music.note")
                    Text("Медиатека")
                }

                ZStack {
                    Text("Радио")
                    PlaybackView()
                }
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Радио")
                }

                ZStack {
                    Text("Поиск")
                    PlaybackView()
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }

            }
            .navigationTitle("Медиатека")
            .toolbar {
                Button {
                    isEditMode.toggle()
                } label: {
                    if isEditMode {
                        Text("Готово")
                    } else {
                        Text("Править")
                    }
                }
                .foregroundColor(.red)

            }
            .environment(\.editMode, .constant(self.isEditMode ? EditMode.active : EditMode.inactive))
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
