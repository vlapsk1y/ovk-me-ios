//
//  AccountEndpoint.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 31.07.2022.
//

import Foundation

enum AccountEndpoint {
    case getProfileInfo
    case getInfo
    case setOnline
    case setOffline
    case getCounters
}

extension AccountEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .getProfileInfo:
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/account.getProfileInfo"
            urlcomponents.queryItems = [
                URLQueryItem(name: "access_token", value: UserDefaults.standard.string(forKey: "access_token"))
            ]
            
            guard let url = urlcomponents.url
            else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
            
        case .getInfo:
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/account.getInfo"
            urlcomponents.queryItems = [
                URLQueryItem(name: "access_token", value: UserDefaults.standard.string(forKey: "access_token"))
            ]
            
            guard let url = urlcomponents.url
            else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
            
        case .getCounters:
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/account.getCounters"
            urlcomponents.queryItems = [
                URLQueryItem(name: "access_token", value: UserDefaults.standard.string(forKey: "access_token"))
            ]
            
            guard let url = urlcomponents.url
            else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
            
        case .setOnline:
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/account.setOnline"
            urlcomponents.queryItems = [
                URLQueryItem(name: "access_token", value: UserDefaults.standard.string(forKey: "access_token"))
            ]
            
            guard let url = urlcomponents.url
            else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
        case .setOffline:
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/account.setOffline"
            urlcomponents.queryItems = [
                URLQueryItem(name: "access_token", value: Prefs().token)
            ]
            
            guard let url = urlcomponents.url
            else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
            
        }
    }
}
