//
//  MessagesEndpoint.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 19.08.2022.
//

import Foundation

enum MessagesEndpoint {
    case getConversations
    case getHistory(userId: Int)
    case send(userId: Int, peerId: Int?, message: String)
}

extension MessagesEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .getConversations:
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/messages.getConversations"
            urlcomponents.queryItems = [
                URLQueryItem(name: "access_token", value: Prefs().token),
                URLQueryItem(name: "extended", value: "1"),
                URLQueryItem(name: "fields", value: "verified,photo_100")
            ]
            
            guard let url = urlcomponents.url
            else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
            
        case .getHistory(let userId):
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/messages.getHistory"
            urlcomponents.queryItems = [
                URLQueryItem(name: "access_token", value: Prefs().token),
                URLQueryItem(name: "user_id", value: String(userId))
            ]
            
            guard let url = urlcomponents.url
            else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
            
        case .send(let userId, _, let message):
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/messages.send"
            urlcomponents.queryItems = [
                URLQueryItem(name: "access_token", value: Prefs().token),
                URLQueryItem(name: "user_id", value: String(userId)),
                URLQueryItem(name: "message", value: message)
            ]
            
            guard let url = urlcomponents.url
            else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
        }
    }
}
