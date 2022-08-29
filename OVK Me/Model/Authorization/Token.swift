//
//  Token.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 18.07.2022.
//

import Foundation

struct Token: Decodable {
    let accessToken: String
    let expiresIn: Int
    let userId: Int
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case userId = "user_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
        self.expiresIn = try container.decode(Int.self, forKey: .expiresIn)
        self.userId = try container.decode(Int.self, forKey: .userId)
    }
    
    init() {
        self.accessToken = ""
        self.expiresIn = 0
        self.userId = 0
    }
}
