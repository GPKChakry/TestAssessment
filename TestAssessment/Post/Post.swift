//
//  Post.swift
//  TestAssessment
//
//  Created by Chakry GPK on 29/04/24.
//

import Foundation

struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
