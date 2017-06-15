//
//  API.swift
//  TheTuneSquad
//
//  Created by Christina Lee on 6/6/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import Foundation

class API {
    static let shared = API()
    
    private var session : URLSession
    private var components : URLComponents
    
    private init() {
        self.session = URLSession(configuration: .default)
        self.components = URLComponents()
        
        self.components.scheme = "https"
        self.components.host = "api.spotify.com/v1"
    }
    
    func searchArist(){
        
        self.components.path = "/search"
        
        if let token = UserDefaults.standard.getAccessToken() {
            let queryItem = URLQueryItem(name: "access_token", value: token)
            self.components.queryItems = [queryItem]
            
        }
    }
}
