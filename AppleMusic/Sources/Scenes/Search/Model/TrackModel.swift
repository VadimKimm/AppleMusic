//
//  TrackModel.swift
//  AppleMusic
//
//  Created by Vadim Kim on 22.09.2022.
//

import Foundation

struct TrackModel: Identifiable, Hashable {
    let id = UUID()
    var author: String
    var song: String
    var image: String
}

extension TrackModel {
    static func getData() -> [TrackModel] {
        let tracks = [
        TrackModel(author: "Juice WRLD", song: "Empty", image: "juice"),
        TrackModel(author: "A$AP Rocky", song: "Praise The Lord", image: "asap"),
        TrackModel(author: "Roddy Ricch", song: "The Box", image: "roddy"),
        TrackModel(author: "Wu-Tang Clan", song: "C.R.E.A.M", image: "wutang"),
        TrackModel(author: "Imagine Dragons", song: "Curse", image: "imagineDragons"),
        TrackModel(author: "Red Hot Chili Peppers", song: "Otherside", image: "rhcp"),
        TrackModel(author: "Bloodhound Gang", song: "The Bad Touch", image: "bloodhound"),
        TrackModel(author: "Maroon 5", song: "Misery", image: "maroon"),
        TrackModel(author: "Calvin Harris", song: "Summer", image: "calvin"),
        ]

        return tracks
    }
}
