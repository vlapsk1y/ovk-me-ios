//
//  CanWrite.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 19.08.2022.
//

import Foundation

struct CanWrite: Decodable {
    let allowed: Bool
    
    enum CodingKeys: String, CodingKey {
        case allowed
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.allowed = try container.decode(Bool.self, forKey: .allowed)
    }
    
    init() {
        self.allowed = true
    }
}
