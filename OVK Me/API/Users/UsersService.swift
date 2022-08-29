//
//  UsersService.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 14.08.2022.
//

import Foundation
import Combine

protocol UsersService {
    var apiSession: APIService {get}
    
    func get(user_ids: String, fields: String) -> AnyPublisher<ResponseArray<User>, APIError>
}

extension UsersService {
    func get(user_ids: String, fields: String) -> AnyPublisher<ResponseArray<User>, APIError> {
        return apiSession.request(with: UsersEndpoint.get(user_ids: user_ids, fields: fields))
            .eraseToAnyPublisher()
    }
}
