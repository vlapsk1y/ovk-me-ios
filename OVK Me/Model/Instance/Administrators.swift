//
//  Administrators.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 27.08.2022.
//

import Foundation

struct Administrators: Decodable {
    let count: Int
    let profiles: [User]
    
    enum CodingKeys: String, CodingKey {
        case count
        case profiles = "items"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.count = try container.decode(Int.self, forKey: .count)
        self.profiles = try container.decode([User].self, forKey: .profiles)
    }
    
    init() {
        self.count = 1
        self.profiles = Array(arrayLiteral: User())
    }
}
