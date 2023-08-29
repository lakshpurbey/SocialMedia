//
//  FeeddetailsVC.swift
//  SocialVideoAssignment
//
//  Created by Mac on 26/08/2023.
//

import UIKit
import AVKit
import AVFoundation

class FeeddetailsVC: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet weak var view_Video: UIView!

    @IBOutlet weak var lbl_Username: UILabel!

    @IBOutlet weak var lbl_Likes: UILabel!

    @IBOutlet weak var img_Profile: UIImageView!

    var feeds: Result?

    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //Configure data
        self.navigationItem.title = "Post"

        let strlikes = String(feeds?.likes ?? 0) + " " + "Like"

        lbl_Username.text = feeds?.user
        lbl_Likes.text = strlikes

        VideoDisplay()

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        img_Profile.addGestureRecognizer(tap)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code

        let mainView = UIStoryboard(name:"Main", bundle: nil)
        let viewcontroller : ProfileVC = mainView.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        viewcontroller.username = feeds?.user
        player.pause()
        self.navigationController?.pushViewController(viewcontroller, animated: true)

    }

    func VideoDisplay() {
        let videoURL = URL(string: feeds?.videoURL ?? "")

         player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view_Video.bounds
        playerLayer.videoGravity = AVLayerVideoGravity.resize
        player.playImmediately(atRate: 1.0)

        self.view_Video.layer.addSublayer(playerLayer)
        player.play()

    }


}
