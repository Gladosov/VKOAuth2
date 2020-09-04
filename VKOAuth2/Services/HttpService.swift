//
//  HttpService.swift
//  VKOAuth2
//
//  Created by Admin on 04.09.2020.
//  Copyright © 2020 Danil Semenov. All rights reserved.
//

import Alamofire

protocol HttpService {
    var sessionManager: Session { get set }
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
