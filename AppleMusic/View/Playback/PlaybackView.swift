//
//  PlaybackView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 27.08.2022.
//

import SwiftUI

struct PlaybackView: View {
    var body: some View {
        VStack {
            Spacer()

            HStack {
                Image("albumImage")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .cornerRadius(10)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Travis Scott")
                        .font(.headline)
                    Text("Sicko mode")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Button() {
                    print("Pause button pressed")
                } label: {
                    Image(systemName: "play.fill")
                        .font(.title)
                        .foregroundColor(.black)
                }

                Button {
                    print("Forward button pressed")
                } label: {
                    Image(systemName: "forward.fill")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                }
            }
        }
    }
}

struct PlaybackView_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackView()
    }
}
