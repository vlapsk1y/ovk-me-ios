//
//  MessagesModelData.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 19.08.2022.
//

import Foundation
import Combine

class MessagesModelData: ObservableObject, MessagesService {
    internal var apiSession: APIService
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var showErrorAlert = false
    @Published var conversations: [Chat] = []
    @Published var profiles: [User] = []
    @Published var messages: [Message] = []
    @Published var isLoading: Bool = true
    
    init(apiService: APIService = APISession()) {
        self.apiSession = apiService
    }
    
    func getConversations() {
        let cancellable = self.getConversations()
            .sink { [weak self] (result) in
                switch result {
                case .failure(_):
                    break
                case .finished:
                    break
                }
            } receiveValue: { (detail) in
                self.isLoading.toggle()
                self.conversations = detail.resposne.items
                self.profiles = detail.resposne.profiles!
            }
        
        cancellables.insert(cancellable)
    }
    
    func getHistory(userId: Int) {
        let cancellable = self.getHistory(userId: userId)
            .sink { [weak self] (result) in
                switch result {
                case .failure(_):
                    break
                case .finished:
                    break
                }
            } receiveValue: { (detail) in
                self.isLoading.toggle()
                self.messages = detail.resposne.items.reversed()
            }
        
        cancellables.insert(cancellable)
    }
    
    func send(userId: Int, peerId: Int?, message: String) {
        let cancellable = self.send(userId: userId, peerId: peerId, message: message)
            .sink { [weak self] (result) in
                switch result {
                case .failure(_):
                    break
                case .finished:
                    break
                }
            } receiveValue: { _ in }
        
        cancellables.insert(cancellable)
    }
}
