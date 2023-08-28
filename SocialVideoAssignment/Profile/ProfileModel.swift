//
//  ProfileModel.swift
//  SocialVideoAssignment
//
//  Created by Mac on 28/08/2023.
//

import Foundation

// MARK: - NewsModelResponse
struct ProfileModelResponse: Codable {
    let status: String
    let data: DataProfile
}

// MARK: - DataClass
struct DataProfile: Codable {
    let id, name, userName, email: String
    let profilePic: String
    let posts: [Post]

    enum CodingKeys: String, CodingKey {
        case id, name
        case userName = "user_name"
        case email
        case profilePic = "profile_pic"
        case posts
    }
}

// MARK: - Post
struct Post: Codable {
    let id: Int
    let videoURL: String
    let likes: Int
    let createdAt: String
    let thumbnailURL: String
    let user: String

    enum CodingKeys: String, CodingKey {
        case id
        case videoURL = "video_url"
        case likes
        case createdAt = "created_at"
        case thumbnailURL = "thumbnail_url"
        case user
    }
}
