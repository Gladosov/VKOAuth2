//
//  VKStore.swift
//  VKOAuth2
//
//  Created by Admin on 21.08.2020.
//  Copyright © 2020 Danil Semenov. All rights reserved.
//

import Foundation

protocol VKService {
    func fetchFriends(offset: Int, completion: @escaping (FriendsResponse?) -> Void)
}

class VKStore: VKService {
    
    let accessToken: String
    let userID: String

    private let baseAPIUrl = "https://api.vk.com/method"
    
    init(accessToken: String, userID: String) {
        self.accessToken = accessToken
        self.userID = userID
    }
    
    func fetchFriends(offset: Int, completion: @escaping (FriendsResponse?) -> Void) {
        
        let params: [String: String] = [
            "user_id": userID,
            "count": "10",
            "offset": "\(offset)",
            "fields": "photo_200_orig",
            "v": "5.122"
        ]
        
        loadAndDecode(url: URL(string: "\(baseAPIUrl)/friends.get")!, params: params,complition: completion)
    }
    
    private func loadAndDecode<D: Decodable>(url: URL, params: [String:String]? = nil, complition: @escaping (D?) -> Void) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            complition(nil)
            return
        }
        
        var queryItems = [URLQueryItem(name: "access_token", value: accessToken)]
        if let params = params {
            queryItems.append(contentsOf: params.map({
                URLQueryItem(name: $0, value: $1)
            }))
        }
        urlComponents.queryItems = queryItems
        
        guard let finalURL = urlComponents.url else {
            complition(nil)
            return
        }
        
        URLSession.shared.dataTask(with: finalURL) { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async {
                    complition(nil)
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                DispatchQueue.main.async {
                    complition(nil)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    complition(nil)
                }
                return
            }
            
            do {
                let response = try JSONDecoder().decode(D.self, from: data)
                DispatchQueue.main.async {
                    complition(response)
                }
            }
            catch {
                complition(nil)
                return
            }
            
        }.resume()
    }
}
