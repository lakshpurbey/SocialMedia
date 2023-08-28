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

//    let videoUrl = URL(string: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4")!
//
//    let asset = AVURLAsset(url: self().videoUrl)
//   let primaryPlayerItem = AVPlayerItem(asset: asset)
//
//
//    private lazy var player: AVPlayer = AVPlayer(playerItem: primaryPlayerItem)
//
//    private lazy var playerLayer: AVPlayerLayer = {
//        let playerLayer = AVPlayerLayer(player: self.player)
//        playerLayer.videoGravity = .resizeAspectFill
//        return playerLayer
//    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.view_VideoDispaly.layer.addSublayer(self.playerLayer)


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//        playerLayer.frame = view_VideoDispaly.layer.bounds

    }

}
