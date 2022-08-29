//
//  Peer.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 19.08.2022.
//

import Foundation

struct Peer: Decodable {
    let id: Int
    let type: String
    let localId: Int
    
    enum CodingKeys: String, CodingKey {
        case id, type
        case localId = "local_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.type = try container.decode(String.self, forKey: .type)
        self.localId = try container.decode(Int.self, forKey: .localId)
    }
    
    init() {
        self.id = 1
        self.type = "user"
        self.localId = 1
    }
}
