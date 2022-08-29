//
//  AuthorizationEndpoint.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 30.07.2022.
//

import Foundation

enum AuthorizationEndpoint {
    case getToken(email: String, password: String)
}

extension AuthorizationEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .getToken(let email, let password):
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/token"
            urlcomponents.queryItems = [
                URLQueryItem(name: "username", value: email),
                URLQueryItem(name: "password", value: password),
                URLQueryItem(name: "grant_type", value: "password")
            ]
            
            guard let url = urlcomponents.url
                else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
        }
    }
}
