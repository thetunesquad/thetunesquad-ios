//
//  Artist.swift
//  TheTuneSquad
//
//  Created by Christina Lee on 6/7/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import Foundation

class Artist {
    let id : String
    let name : String
    let uri : String
    let imageURL : String
    
    init(id: String, name: String, uri: String, imageURL: String) {
        self.id = id
        self.name = name
        self.uri = uri
        self.imageURL = imageURL
    }
}
