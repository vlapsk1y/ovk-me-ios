//
//  AboutInstanceModelData.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 27.08.2022.
//

import Foundation
import Combine

class InstanceModelData: ObservableObject, InstanceService {
    internal var apiSession: APIService
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var version: String = ""
    @Published var aboutInstance: AboutInstance = AboutInstance()
    @Published var isLoading: Bool = true
    
    init(apiService: APIService = APISession()) {
        self.apiSession = apiService
    }
    
    func getVersion() {
        let cancellable = self.getVersion()
            .sink { [weak self] (result) in
                switch result {
                case .failure(_):
                    break
                case .finished:
                    break
                }
            } receiveValue: { (detail) in
                self.version = detail.resposne
            }
        
        cancellables.insert(cancellable)
    }
    
    func getAboutInstance() {
        let cancellable = self.getAboutInstance()
            .sink { [weak self] (result) in
                switch result {
                case .failure(_):
                    break
                case .finished:
                    break
                }
            } receiveValue: { (detail) in
                self.aboutInstance = detail.resposne
                self.isLoading.toggle()
            }
        cancellables.insert(cancellable)
    }
}
