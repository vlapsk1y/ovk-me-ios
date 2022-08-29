//
//  UsersModelData.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 21.08.2022.
//

import Foundation
import Combine

class UsersModelData: ObservableObject, UsersService {
    internal var apiSession: APIService
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var users: [User] = []
    var isLoading: Bool = true
    
    init(apiService: APIService = APISession()) {
        self.apiSession = apiService
    }
    
    func get(user_ids: String, fields: String) {
        let cancellable = self.get(user_ids: user_ids, fields: fields)
            .sink { _ in } receiveValue: { (detail) in
                print(detail.resposne)
                self.users = detail.resposne
                self.isLoading.toggle()
            }
        
        cancellables.insert(cancellable)
    }
}
