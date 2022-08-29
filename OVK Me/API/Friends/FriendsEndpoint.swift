//
//  FriendsEndpoint.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 31.07.2022.
//

import Foundation

enum FriendsEndpoint {
    case getFriends(userId: Int, fields: String? = "photo_100,photo_200,photo_200_orig,screen_name,has_photo,photo_max_orig,photo_max,photo_50,sex,verified,status,music,movies,tv,books,city,interests")
    case getRequests
    case add(userId: Int)
    case delete(userId: Int)
}

extension FriendsEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .getFriends(let userId, let fields):
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/friends.get"
            urlcomponents.queryItems = [
                URLQueryItem(name: "user_id", value: String(userId)),
                URLQueryItem(name: "access_token", value: UserDefaults.standard.string(forKey: "access_token")),
                URLQueryItem(name: "fields", value: fields)
            ]
            
            guard let url = urlcomponents.url
                else { preconditionFailure("invalid url format") }
                             
            return URLRequest(url: url)
        case .getRequests:
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/friends.getrequests"
            urlcomponents.queryItems = [
                URLQueryItem(name: "access_token", value: Prefs().token),
                URLQueryItem(name: "fields", value: "photo_100,online,sex,city")
            ]
            
            guard let url = urlcomponents.url
                else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
        case .add(let userId):
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/friends.add"
            urlcomponents.queryItems = [
                URLQueryItem(name: "access_token", value: Prefs().token),
                URLQueryItem(name: "user_id", value: String(userId))
            ]
            
            guard let url = urlcomponents.url
                else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
        case .delete(let userId):
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/friends.delete"
            urlcomponents.queryItems = [
                URLQueryItem(name: "access_token", value: Prefs().token),
                URLQueryItem(name: "user_id", value: String(userId))
            ]
            
            guard let url = urlcomponents.url
                else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
        }
    }
}
