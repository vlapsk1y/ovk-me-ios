//
//  LinkInstance.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 27.08.2022.
//

import Foundation

struct LinkInstance: Decodable, Hashable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
    }
    
    init() {
        self.name = "pornhub"
        self.url = "https://pornhub.com"
    }
}
