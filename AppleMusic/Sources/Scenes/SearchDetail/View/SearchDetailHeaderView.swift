//
//  SearchDetailHeaderView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 14.09.2022.
//

import SwiftUI

struct SearchDetailHeaderView: View {
    var title: String

    var body: some View {
        VStack{
            Divider()
                .padding(.all, Metrics.padding)

            HStack {
                Text(title)
                    .font(.title3)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)

                Spacer()

                Button("См. все") {
                    print("123")
                }
                .foregroundColor(.red)
            }
            .padding(.horizontal, Metrics.padding)
        }
    }
}

struct SearchDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailHeaderView(title: "Test")
    }
}

extension SearchDetailHeaderView {
    enum Metrics {
        static let padding: CGFloat = 8
    }
}
