//
//  User.swift
//  VKOAuth2
//
//  Created by Admin on 21.08.2020.
//  Copyright © 2020 Danil Semenov. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let photoURL: String
    let isOnline: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name", lastName = "last_name"
        case photoURL = "photo_200_orig"
        case isOnline = "online"
    }
}

struct FriendsResponse: Decodable {
    struct Response: Decodable {
        var count: Int
        var friends: [User]
        
        enum CodingKeys: String, CodingKey {
            case count = "count"
            case friends = "items"
        }
    }
    let response: Response
}
