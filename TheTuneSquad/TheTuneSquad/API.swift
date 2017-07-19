//
//  API.swift
//  TheTuneSquad
//
//  Created by Christina Lee on 6/6/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

let koAuthBaseURLString = "https://accounts.spotify.com/"


enum SpotifyAuthError : Error {
    case extractingCode
}

enum SaveOptions {
    case userDefaults
}

typealias SpotifyAuthCompletion = (Bool) -> ()
typealias FetchArtistCompletion = ([Artist]?) -> ()
typealias FetchTrackCompletion = ([Track]?) -> ()

class API {
    static let shared = API()
    
    private var session : URLSession
    private var components : URLComponents
    
    let spotifyClientId = kSpotifyClientId
    let spotifyClientSecret = kSpotifyClientSecret
    let spotifyRedirectURI = "tunesquadios://"
    
    private init() {
        self.session = URLSession(configuration: .default)
        self.components = URLComponents()
        
        self.components.scheme = "https"
        self.components.host = "api.spotify.com/v1"
    }
    
    func oAuth(){
        if let requestURL = URL(string: "\(koAuthBaseURLString)authorize/?client_id=\(spotifyClientId)&response_type=code&redirect_uri=\(spotifyRedirectURI)&scope=playlist-modify-public") {
            print(requestURL.absoluteString)
            UIApplication.shared.open(requestURL)
        }
    }
    
    func getCodeFrom(url: URL) throws -> String {
        guard let code = url.absoluteString.components(separatedBy: "&").first?.components(separatedBy: "=").last else {
            throw SpotifyAuthError.extractingCode
        }
        return code
    }
    
    func tokenRequestFor(url: URL, saveOptions: SaveOptions, completion: @escaping SpotifyAuthCompletion) {
        func complete(success: Bool) {
            OperationQueue.main.addOperation {
                completion(success)
            }
        }
        do {
            let code = try self.getCodeFrom(url: url)
            
            print("code: \(code)")
            
//            let session = URLSession.shared
            
            let requestString = "\(koAuthBaseURLString)api/token"
            
            let urlString = URL(string: requestString)!
//                let session = URLSession(configuration: .default)
//                session.dataTask(with: urlString, completionHandler: { (data, response, error) in
//                    if error != nil { complete(success: false)}
//                    guard let data = data else { complete(success: false); return }
//                    
//                    guard let dataString = String(data: data, encoding: .utf8) else { complete(success: false); return }
//                    
//                    
//                    print("datastring: \(dataString)")
//                    guard let token = dataString.components(separatedBy: "&").first?.components(separatedBy: "=").last else { complete(success: false); return }
//                    
//                    let tokenResult = UserDefaults.standard.save(accessToken: token)
//                    print("Token Result: \(tokenResult)")
//                    complete(success: true)
//
//                    
//                }).resume()
//            }
            
            var request = URLRequest(url: urlString)
            request.httpMethod = "POST"
            
//            let grant = "authorization_code"
            
            let authString = String(format: "%@ : %@", spotifyClientId, spotifyClientSecret)
            let authData = authString.data(using: String.Encoding.utf8)! as NSData
            let base64 = authData.base64EncodedData(options: NSData.Base64EncodingOptions(rawValue:0))
//            let myBase64Data = myNSData.base64EncodedData(options: NSData.Base64EncodingOptions.endLineWithLineFeed)
            
            let json : [String : String] = ["grant_type" : "authorization_code", "code" : code, "redirect_uri": spotifyRedirectURI]

            let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
            request.httpBody = jsonData
            request.setValue("Basic \(base64)", forHTTPHeaderField: "Authorization:")
            
            session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
                if error != nil { complete(success: false) }
                
                guard let data = data else { complete(success: false); return }
                
                guard let dataString = String(data: data, encoding: .utf8) else { complete(success: false); return }
              
                
                print("datastring: \(dataString)")
                guard let token = dataString.components(separatedBy: "&").first?.components(separatedBy: "=").last else { complete(success: false); return }
                
                let tokenResult = UserDefaults.standard.save(accessToken: token)
                print("Token Result: \(tokenResult)")
                complete(success: true)

            }).resume()
            
        } catch {
            print(error)
            complete(success: false)
        }
    }
    
    func searchArist(){
        
        self.components.path = "/search"
        
        if let token = UserDefaults.standard.getAccessToken() {
            let queryItem = URLQueryItem(name: "access_token", value: token)
            self.components.queryItems = [queryItem]
            
        }
    }
}
