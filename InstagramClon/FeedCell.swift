//
//  FeedCell.swift
//  InstagramClon
//
//  Created by Rogelio Lopez on 3/9/22.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var cellPhotoView: UIImageView!
    @IBOutlet weak var cellUsername: UILabel!
    @IBOutlet weak var cellCaption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
