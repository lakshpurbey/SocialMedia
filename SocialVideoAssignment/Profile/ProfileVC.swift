//
//  ProfileVC.swift
//  SocialVideoAssignment
//
//  Created by Mac on 26/08/2023.
//

import UIKit

class ProfileVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var view_Profile: UIView!
    @IBOutlet weak var img_User: UIImageView!
    @IBOutlet weak var lbl_User: UILabel!
    @IBOutlet weak var lbl_Likes: UILabel!

    @IBOutlet weak var clt_Videos: UICollectionView!

    private var posts: [Post]?
    private var apiService : APIService!

    var username : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        clt_Videos.delegate = self
        clt_Videos.dataSource = self

        APIFetch()
    }

    func APIFetch() {
        self.apiService =  APIService()
        self.apiService.apiToGetDataProfile(username: username ?? ""){ (posts) in

            print("Postss", posts.data.name)


//            lbl_Likes.text = posts.data.

            self.posts = posts.data.posts

            print("self.postsself.posts", self.posts)

            DispatchQueue.main.async {
                self.lbl_User.text = posts.data.name
                self.img_User.setImageFromUrl(ImageURL: posts.data.profilePic)

                self.clt_Videos.reloadData()
            }
        }
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VideoProfileCollectionViewCell

        let datamap = self.posts?[indexPath.row]
        print("datamap", datamap)

        let strlikes = String(datamap?.likes ?? 0) + " " + "Like"
        cell.lbl_Likes.text = strlikes

        cell.img_thumbnail.setImageFromUrl(ImageURL: datamap?.thumbnailURL ?? "")
        
        return cell
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        return CGSize(width: 174, height: 166)
//
//    }


}
