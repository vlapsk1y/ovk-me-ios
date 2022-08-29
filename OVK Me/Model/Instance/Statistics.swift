//
//  Statistics.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 27.08.2022.
//

import Foundation

struct Statistics: Decodable {
    let usersCount: Int
    let onlineUsersCount: Int
    let activeUsersCount: Int
    let groupsCount: Int
    let wallPostsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case usersCount = "users_count"
        case onlineUsersCount = "online_users_count"
        case activeUsersCount = "active_users_count"
        case groupsCount = "groups_count"
        case wallPostsCount = "wall_posts_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.usersCount = try container.decode(Int.self, forKey: .usersCount)
        self.onlineUsersCount = try container.decode(Int.self, forKey: .onlineUsersCount)
        self.activeUsersCount = try container.decode(Int.self, forKey: .activeUsersCount)
        self.groupsCount = try container.decode(Int.self, forKey: .groupsCount)
        self.wallPostsCount = try container.decode(Int.self, forKey: .wallPostsCount)
    }
    
    init() {
        self.usersCount = 1
        self.onlineUsersCount = 1
        self.activeUsersCount = 1
        self.groupsCount = 1
        self.wallPostsCount = 1
    }
}
