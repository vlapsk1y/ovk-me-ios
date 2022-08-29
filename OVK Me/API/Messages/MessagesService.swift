//
//  MessagesService.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 19.08.2022.
//

import Foundation
import Combine

protocol MessagesService {
    var apiSession: APIService {get}
    
    func getConversations() -> AnyPublisher<ResponseAPI<ResponseList<Chat>>, APIError>
    func getHistory(userId: Int) -> AnyPublisher<ResponseAPI<ResponseList<Message>>, APIError>
    func send(userId: Int, peerId: Int?, message: String) -> AnyPublisher<ResponseAPI<Int>, APIError>
}

extension MessagesService {
    func getConversations() -> AnyPublisher<ResponseAPI<ResponseList<Chat>>, APIError> {
        return apiSession.request(with: MessagesEndpoint.getConversations)
            .eraseToAnyPublisher()
    }
    
    func getHistory(userId: Int) -> AnyPublisher<ResponseAPI<ResponseList<Message>>, APIError> {
        return apiSession.request(with: MessagesEndpoint.getHistory(userId: userId))
            .eraseToAnyPublisher()
    }
    
    func send(userId: Int, peerId: Int?, message: String) -> AnyPublisher<ResponseAPI<Int>, APIError> {
        return apiSession.request(with: MessagesEndpoint.send(userId: userId, peerId: peerId, message: message))
            .eraseToAnyPublisher()
    }
}
