//
//  FeedVC.swift
//  SocialVideoAssignment
//
//  Created by Mac on 26/08/2023.
//

import UIKit
import AVKit
import AVFoundation
import SDWebImage
import IHProgressHUD

class FeedVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tbl_feed: UITableView!

    private var feeds: [Result]?
    private var apiService : APIService!

    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        tbl_feed.delegate = self
        tbl_feed.dataSource = self

        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tbl_feed.addSubview(refreshControl) //

        APIFetch()

    }

    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        APIFetch()
    }

    func APIFetch() {
        //With Dispatch Queue
        self.apiService =  APIService()
        self.apiService.apiToGetData { (feed) in
            self.feeds = feed.data.results

            DispatchQueue.main.async {
                self.tbl_feed.reloadData()
                self.refreshControl.endRefreshing()

            }
        }
    }


    @IBAction func btn_Profile(_ sender: Any) {
        ProfileRoute()
    }

    func ProfileRoute() {
        let mainView = UIStoryboard(name:"Main", bundle: nil)
        let viewcontroller : UIViewController = mainView.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(viewcontroller, animated: true)

    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.feeds?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! feedTableViewCell

         let feeddata = self.feeds?[indexPath.section]

         cell.lbl_Username.text = feeddata?.user

         let strlikes = String(feeddata?.likes ?? 0) + " " + "Like"
         cell.lbl_VideoLikes.text = strlikes

         cell.view_VideoDispaly.sd_setImage(with: URL(string: feeddata?.thumbnailURL ?? ""), placeholderImage: UIImage(named: "Avatar.png"))

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let feeddata = self.feeds?[indexPath.section]

        let mainView = UIStoryboard(name:"Main", bundle: nil)
        let viewcontroller : FeeddetailsVC = mainView.instantiateViewController(withIdentifier: "FeeddetailsVC") as! FeeddetailsVC
        viewcontroller.feeds = feeddata
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }

}

extension UIImageView {

    func setImageFromUrl(ImageURL :String) {
       URLSession.shared.dataTask( with: NSURL(string:ImageURL)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                self.image = UIImage(data: data)
             }
          }
       }).resume()
    }

}
