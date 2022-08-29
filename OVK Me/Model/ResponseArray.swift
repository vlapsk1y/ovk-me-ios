//
//  ResponseArray.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 23.08.2022.
//

import Foundation

struct ResponseArray<T: Decodable>: Decodable {
    let resposne: [T]
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.resposne = try container.decode([T].self, forKey: .response)
    }
}

