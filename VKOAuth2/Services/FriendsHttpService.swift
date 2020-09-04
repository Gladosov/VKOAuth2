//
//  FriendsHttpService.swift
//  VKOAuth2
//
//  Created by Admin on 04.09.2020.
//  Copyright © 2020 Danil Semenov. All rights reserved.
//

import Alamofire

final class FriendsHttpService: HttpService {
    var sessionManager: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
}
