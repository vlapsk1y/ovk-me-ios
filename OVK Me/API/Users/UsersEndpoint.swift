//
//  UsersEndpoint.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 14.08.2022.
//

import Foundation

enum UsersEndpoint {
    case get(user_ids: String, fields: String? = "photo_100,photo_200,photo_200_orig,screen_name,has_photo,photo_max_orig,photo_max,photo_50,sex,verified,status,music,movies,tv,books,city,interests")
}

extension UsersEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .get(let user_ids, let fields):
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/users.get"
            urlcomponents.queryItems = [
                URLQueryItem(name: "user_ids", value: String(user_ids)),
                URLQueryItem(name: "fields", value: String(fields!))
            ]
            
            guard let url = urlcomponents.url
            else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
        }
    }
}
