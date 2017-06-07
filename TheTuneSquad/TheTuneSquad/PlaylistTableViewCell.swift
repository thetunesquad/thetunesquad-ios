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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
    }
}
