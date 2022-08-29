//
//  AuthorizationService.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 30.07.2022.
//

import Foundation
import Combine

protocol AuthorizationService {
    var apiSession: APIService {get}
    
    func getToken(email: String, password: String) -> AnyPublisher<Token, APIError>
    
    func logout() -> Void
}

extension AuthorizationService {
    
    func getToken(email: String, password: String) -> AnyPublisher<Token, APIError> {
        return apiSession.request(with: AuthorizationEndpoint.getToken(email: email, password: password))
            .eraseToAnyPublisher()
    }
    
    func logout() -> Void { }
}
