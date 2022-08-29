//
//  AccountModelData.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 12.08.2022.
//

import Foundation
import Combine

class AccountModelData: ObservableObject, AccountService {
    internal var apiSession: APIService
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var showErrorAlert = false
    
    @Published var counters: Counters = Counters()
    @Published var profileInfo: ProfileInfo = ProfileInfo()
    @Published var info: GetInfo = GetInfo()
    
    init(apiService: APIService = APISession()) {
        self.apiSession = apiService
    }
    
    func getProfileInfo() {
        let cancellable = self.getProfileInfo()
            .sink { [weak self] (result) in
                switch result {
                case .failure(_):
                    break
                case .finished:
                    break
                }
            } receiveValue: { (detail) in
                self.profileInfo = detail.resposne
            }
        
        cancellables.insert(cancellable)
    }
    
    func getCounters() {
        let cancellable = self.getCounters()
            .sink { [weak self] (result) in
                switch result {
                case .failure(_):
                    break
                case .finished:
                    break
                }
            } receiveValue: { (detail) in
                self.counters = detail.resposne
            }
        cancellables.insert(cancellable)
    }
    
    func getInfo() {
        let cancellable = self.getInfo()
            .sink { [weak self] (result) in
                switch result {
                case .failure(_):
                    break
                case .finished:
                    break
                }
            } receiveValue: { (detail) in
                self.info = detail.resposne
            }
        cancellables.insert(cancellable)
    }
    
    func setOnline() {
        let cancellable = self.setOnline()
            .sink { _ in  } receiveValue: { _ in }
        
        cancellables.insert(cancellable)
    }
    
    func setOffline() {
        let cancellable = self.setOnline()
            .sink { _ in  } receiveValue: { _ in }
        
        cancellables.insert(cancellable)
    }
}
