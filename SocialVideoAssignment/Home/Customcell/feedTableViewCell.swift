//
//  feedTableViewCell.swift
//  SocialVideoAssignment
//
//  Created by Mac on 26/08/2023.
//

import UIKit
import AVKit
import AVFoundation

class feedTableViewCell: UITableViewCell {

    @IBOutlet var view_VideoDispaly: UIImageView!
    @IBOutlet var lbl_Username: UILabel!
    @IBOutlet var lbl_VideoLikes: UILabel!

    @IBOutlet weak var img_Profile: UIImageView!

    @IBOutlet weak var btn_tapProfile: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
