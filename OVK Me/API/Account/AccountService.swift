//
//  AccountService.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 31.07.2022.
//

import Foundation
import Combine

protocol AccountService {
    var apiSession: APIService {get}
    
    func getProfileInfo() -> AnyPublisher<ResponseAPI<ProfileInfo>, APIError>
    
    func getInfo() -> AnyPublisher<ResponseAPI<GetInfo>, APIError>
    
    func setOnline() -> AnyPublisher<ResponseAPI<Int>, APIError>
    
    func setOffline() -> AnyPublisher<ResponseAPI<Int>, APIError>
    
    func getCounters() -> AnyPublisher<ResponseAPI<Counters>, APIError>
}

extension AccountService {
    
    func getProfileInfo() -> AnyPublisher<ResponseAPI<ProfileInfo>, APIError> {
        return apiSession.request(with: AccountEndpoint.getProfileInfo)
            .eraseToAnyPublisher()
    }
    
    func getInfo() -> AnyPublisher<ResponseAPI<GetInfo>, APIError> {
        return apiSession.request(with: AccountEndpoint.getInfo)
            .eraseToAnyPublisher()
    }
    
    func setOnline() -> AnyPublisher<ResponseAPI<Int>, APIError> {
        return apiSession.request(with: AccountEndpoint.setOnline)
            .eraseToAnyPublisher()
    }
    
    func setOffline() -> AnyPublisher<ResponseAPI<Int>, APIError> {
        return apiSession.request(with: AccountEndpoint.setOffline)
            .eraseToAnyPublisher()
    }
    
    func getCounters() -> AnyPublisher<ResponseAPI<Counters>, APIError> {
        return apiSession.request(with: AccountEndpoint.getCounters)
            .eraseToAnyPublisher()
    }
}
