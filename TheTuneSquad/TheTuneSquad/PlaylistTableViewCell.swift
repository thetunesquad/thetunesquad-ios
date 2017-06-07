//
//  PlaylistTableViewCell.swift
//  TheTuneSquad
//
//  Created by Christina Lee on 6/7/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!

    var track: Track! {
        didSet {
            self.artistLabel.text = track.artist
            self.titleLabel.text = track.title
            self.albumLabel.text = track.album
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
    }
}
