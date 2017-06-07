//
//  Track.swift
//  TheTuneSquad
//
//  Created by Christina Lee on 6/7/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import Foundation

class Track {
    let id : String
    let artist : String
    let album : String
    let title : String
    let imageURL : String
    
    init(id: String, artist: String, album: String, title: String, imageURL: String) {
        self.id = id
        self.artist = artist
        self.album = album
        self.title = title
        self.imageURL = imageURL
    }
}
