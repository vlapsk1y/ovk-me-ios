//
//  ResponseList.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 31.07.2022.
//

import Foundation

struct ResponseList<T: Decodable>: Decodable {
    let count: Int?
    let items: [T]
    let profiles: [User]?
    
    enum CodingKeys: String, CodingKey {
        case items, count, profiles
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.count = try? container.decode(Int.self, forKey: .count)
        self.items = try container.decode([T].self, forKey: .items)
        self.profiles = try? container.decode([User].self, forKey: .profiles)
    }
}
