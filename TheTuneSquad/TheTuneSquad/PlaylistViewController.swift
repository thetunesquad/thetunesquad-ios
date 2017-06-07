//
//  PlaylistViewController.swift
//  TheTuneSquad
//
//  Created by Christina Lee on 6/7/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController {
    
    var playlist = [Track]() {
        didSet {
            self.playlistTableView.reloadData()
        }
    }
    @IBOutlet weak var playlistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.playlistTableView.dataSource = self
        
        let nib = UINib(nibName: "PlaylistTableViewCell", bundle: nil)
        self.playlistTableView.register(nib, forCellReuseIdentifier: PlaylistTableViewCell.identifier)
        
        self.playlistTableView.estimatedRowHeight = 80
        self.playlistTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//MARK: UITableViewDelegate UITableViewDataSource
extension PlaylistViewController : UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaylistTableViewCell.identifier, for: indexPath) as! PlaylistTableViewCell
        
        let current = self.playlist[indexPath.row]
        
        cell.track = current
        
        return cell
    }
}
