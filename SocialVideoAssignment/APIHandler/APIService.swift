//
//  APIService.swift
//  SocialVideoAssignment
//
//  Created by Mac on 27/08/2023.
//

import Foundation

class APIService :  NSObject {

    private let sourcesURL = URL(string: baseUrl + "feed/")!

    func apiToGetData(completion : @escaping (FeedModelResponse) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {

                let jsonDecoder = JSONDecoder()

                let imgData = try! jsonDecoder.decode(FeedModelResponse.self, from: data)
                completion(imgData)
            }
        }.resume()
    }

    //Profile


    func apiToGetDataProfile(username: String, completion : @escaping (ProfileModelResponse) -> ()){

        let sourcesURLprofile = URL(string: baseUrl + "profile/" + username)!

        print("sourcesURLprofile", sourcesURLprofile)
        URLSession.shared.dataTask(with: sourcesURLprofile) { (data, urlResponse, error) in
            if let data = data {

                let jsonDecoder = JSONDecoder()

                let imgData = try! jsonDecoder.decode(ProfileModelResponse.self, from: data)
                completion(imgData)
            }
        }.resume()
    }

}
