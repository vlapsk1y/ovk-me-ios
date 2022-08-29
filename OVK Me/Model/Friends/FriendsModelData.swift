//
//  FriendModelData.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 04.08.2022.
//

import Foundation
import Combine

class FriendsModelData: ObservableObject, FriendsService {
    internal var apiSession: APIService
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var friends: [User] = []
    @Published var countRequestToFriends: Int = 0
    var isLoading: Bool = true
    
    init(apiService: APIService = APISession()) {
        self.apiSession = apiService
    }
    
    func getFriends(userId: Int) {
        let cancellable = self.getFriends(userId: userId)
            .sink { _ in } receiveValue: { (detail) in
                print(detail.resposne)
                self.friends = detail.resposne.items
                self.isLoading.toggle()
            }
        
        cancellables.insert(cancellable)
    }
    
    func getRequests() {
        let cancellable = self.getRequests()
            .sink { _ in } receiveValue: { (detail) in
                self.friends = detail.resposne.items
                self.isLoading.toggle()
            }
        
        cancellables.insert(cancellable)
    }
    
    func add(userId: Int) {
        let cancellable = self.add(userId: userId)
            .sink {(result) in
                switch result {
                case .failure(_):
                    break
                case .finished:
                    self.friends = self.friends.filter { $0.id != userId }
                    break
                }} receiveValue: { _ in }
        
        cancellables.insert(cancellable)
    }
    
    func delete(userId: Int) {
        let cancellable = self.delete(userId: userId)
            .sink { (result) in
                switch result {
                case .failure(_):
                    break
                case .finished:
                    self.friends = self.friends.filter { $0.id != userId }
                    break
                }} receiveValue: { _ in }
        
        cancellables.insert(cancellable)
    }
}
