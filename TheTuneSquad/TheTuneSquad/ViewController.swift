//
//  ViewController.swift
//  TheTuneSquad
//
//  Created by Christina Lee on 6/6/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var loginButtonPressed: UIButton!
    
    var auth = SPTAuth.defaultInstance()!
    var session:SPTSession!
    var player: SPTAudioStreamingController?
    var loginUrl: URL?
    
    func setup() {
        SPTAuth.defaultInstance().clientID = "d65d57b404954ef5a16f181b9c8ed8d0"
        
        SPTAuth.defaultInstance().redirectURL = URL(string: "TuneSquadIOS://returnAfterLogin")
        
        SPTAuth.defaultInstance().requestedScopes = [SPTAuthStreamingScope, SPTAuthPlaylistReadPrivateScope, SPTAuthPlaylistModifyPublicScope, SPTAuthPlaylistModifyPrivateScope]
        
        loginUrl = SPTAuth.defaultInstance().spotifyWebAuthenticationURL()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let options = [UIApplicationOpenURLOptionUniversalLinksOnly : false]
        UIApplication.shared.open(loginUrl!, options: options, completionHandler: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setup()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateAfterFirstLogin), name: NSNotification.Name("update"), object: nil)
    }
    
    func initializePlayer(authSession:SPTSession){
        if self.player == nil {
            self.player = SPTAudioStreamingController.sharedInstance()
            self.player!.playbackDelegate = self as! SPTAudioStreamingPlaybackDelegate
            self.player!.delegate = self as! SPTAudioStreamingDelegate
            try! player!.start(withClientId: auth.clientID)
            self.player!.login(withAccessToken: authSession.accessToken)
        }
    }

    
    func updateAfterFirstLogin () {
        
        if let sessionObj:AnyObject = UserDefaults.standard.object(forKey: "SpotifySession") as AnyObject? {
            let sessionDataObj = sessionObj as! Data
            let firstTimeSession = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObj) as! SPTSession
            self.session = firstTimeSession
            initializePlayer(authSession: session)
    }
        
    func audioStreamingDidLogin(_ audioStreaming: SPTAudioStreamingController!) {
        // after a user authenticates a session, the SPTAudioStreamingController is then initialized and this method called
        print("logged in")
        self.player?.playSpotifyURI("spotify:track:58s6EuEYJdlb0kO7awm3Vp", startingWith: 0, startingWithPosition: 0, callback: { (error) in
            if (error != nil) {
                print("playing!")
            }
        })
    }

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
}
