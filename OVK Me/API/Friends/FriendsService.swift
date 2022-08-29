//
//  FriendsService.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 31.07.2022.
//

import Foundation
import Combine

protocol FriendsService {
    var apiSession: APIService {get}
    
    func getFriends(userId: Int) -> AnyPublisher<ResponseAPI<ResponseList<User>>, APIError>
    func getRequests() -> AnyPublisher<ResponseAPI<ResponseList<User>>, APIError>
    func add(userId: Int) -> AnyPublisher<ResponseAPI<Int>, APIError>
    func delete(userId: Int) -> AnyPublisher<ResponseAPI<Int>, APIError>
}

extension FriendsService {
    func getFriends(userId: Int) -> AnyPublisher<ResponseAPI<ResponseList<User>>, APIError> {
        return apiSession.request(with: FriendsEndpoint.getFriends(userId: userId))
            .eraseToAnyPublisher()
    }
    
    func getRequests() -> AnyPublisher<ResponseAPI<ResponseList<User>>, APIError> {
        return apiSession.request(with: FriendsEndpoint.getRequests)
            .eraseToAnyPublisher()
    }
    
    func add(userId: Int) -> AnyPublisher<ResponseAPI<Int>, APIError> {
        return apiSession.request(with: FriendsEndpoint.add(userId: userId))
            .eraseToAnyPublisher()
    }
    
    func delete(userId: Int) -> AnyPublisher<ResponseAPI<Int>, APIError> {
        return apiSession.request(with: FriendsEndpoint.delete(userId: userId))
            .eraseToAnyPublisher()
    }
}
