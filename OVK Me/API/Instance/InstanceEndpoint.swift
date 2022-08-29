//
//  InstanceEndpoint.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 27.08.2022.
//

import Foundation

enum InstanceEndpoint {
    case getVersion, getAboutInstance
}

extension InstanceEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .getVersion:
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/ovk.version"
            
            guard let url = urlcomponents.url
            else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
        
        case .getAboutInstance:
            var urlcomponents = URLComponents()
            urlcomponents.scheme = "https"
            urlcomponents.host = Prefs().APIDomain
            urlcomponents.path = "/method/ovk.aboutinstance"
            urlcomponents.queryItems = [
                URLQueryItem(name: "admin_fields", value: "photo_100")
            ]
            
            guard let url = urlcomponents.url
            else { preconditionFailure("invalid url format") }
            
            return URLRequest(url: url)
        }
    }
}
