//
//  FriendsAPI.swift
//  VKOAuth2
//
//  Created by Admin on 04.09.2020.
//  Copyright © 2020 Danil Semenov. All rights reserved.
//

import Foundation

protocol FriendsAPI {
    func fetchFriends(userId: Int, offset: Int, accessToken: String, completion: @escaping (Result<FrindsResponse, FriendsAPIError>) -> ())
}

enum FriendsAPIError: Error {
    case apiError(message: String = "")
    case parseError(message: String = "")
}
