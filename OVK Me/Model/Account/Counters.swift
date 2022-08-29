//
//  Counters.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 31.07.2022.
//

import Foundation

struct Counters: Decodable {
    var friends: Int
    var notifications: Int
    var messages: Int
    
    enum CodingKeys: String, CodingKey {
        case friends, notifications, messages
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.friends = try container.decode(Int.self, forKey: .friends)
        self.notifications = try container.decode(Int.self, forKey: .notifications)
        self.messages = try container.decode(Int.self, forKey: .messages)
    }
    
    init() {
        self.friends = 0
        self.notifications = 0
        self.messages = 0
    }
}
