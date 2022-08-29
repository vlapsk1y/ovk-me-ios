//
//  InstanceService.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 27.08.2022.
//

import Foundation
import Combine

protocol InstanceService {
    var apiSession: APIService {get}
    
    func getVersion() -> AnyPublisher<ResponseAPI<String>, APIError>
    func getAboutInstance() -> AnyPublisher<ResponseAPI<AboutInstance>, APIError>
}

extension InstanceService {
    func getVersion() -> AnyPublisher<ResponseAPI<String>, APIError> {
        return apiSession.request(with: InstanceEndpoint.getVersion)
            .eraseToAnyPublisher()
    }
    
    func getAboutInstance() -> AnyPublisher<ResponseAPI<AboutInstance>, APIError> {
        return apiSession.request(with: InstanceEndpoint.getAboutInstance)
            .eraseToAnyPublisher()
    }
}
