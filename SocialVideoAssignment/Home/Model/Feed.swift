//
//  Feed.swift
//  SocialVideoAssignment
//
//  Created by Mac on 27/08/2023.
//

import Foundation

// MARK: - FeedModelResponse
struct FeedModelResponse: Codable {
    let status: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let count: Int
//    let next, previous: JSONNull?
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
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

//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
