//
//  Link.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 27.08.2022.
//

import Foundation

struct Links: Decodable {
    let count: Int
    let items: [LinkInstance]
    
    enum CodingKeys: String, CodingKey {
        case count, items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.count = try container.decode(Int.self, forKey: .count)
        self.items = try container.decode([LinkInstance].self, forKey: .items)
    }
    
    init() {
        self.count = 1
        self.items = Array(arrayLiteral: LinkInstance())
    }
}
