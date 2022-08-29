//
//  TokenModelData.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 18.07.2022.
//

import Foundation
import Combine

class TokenModelData: ObservableObject, AuthorizationService {
    internal var apiSession: APIService
    private var prefs = Prefs()
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var showErrorAlert = false
    var alertMessage = "Unknown error"
    @Published var twoFa: Bool = false
    @Published var instance: Bool = false
    
    @Published var token: Token = Token()
    
    init(apiService: APIService = APISession()) {
        self.apiSession = apiService
    }
    
    func getToken(email: String, password: String) {
        
        let cancellable = self.getToken(email: email, password: password)
            .sink { [weak self] (result) in
                switch result {
                case .failure(let error):
                    switch Int(error.localizedDescription) {
                        case 28:
                            self?.alertMessage = "Invalid E-Mail or password"
                        default:
                        self?.alertMessage = "Check your internet connection"
                    }
                    self?.showErrorAlert.toggle()
                case .finished:
                    break
                }
            } receiveValue: { (detail) in
                self.prefs.token = detail.accessToken
                self.prefs.userId = detail.userId
                self.token = detail
            }
        
        cancellables.insert(cancellable)
    }
    
    func setInstance(domain: String) {
        prefs.APIDomain = domain
    }
    
    func logout() {
        prefs.logout()
    }
}
