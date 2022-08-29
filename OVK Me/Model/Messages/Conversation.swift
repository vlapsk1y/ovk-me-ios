//
//  Conversation.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 19.08.2022.
//

import Foundation

struct Conversation: Decodable {
    let peer: Peer
    let lastMessageId: Int
    let inRead: Int
    let outRead: Int
    let isMarkedUnread: Bool
    let important: Bool
    let canWrite: CanWrite
    
    enum CodingKeys: String, CodingKey {
        case peer, important
        case lastMessageId = "last_message_id"
        case inRead = "in_read"
        case outRead = "out_read"
        case isMarkedUnread = "is_marked_unread"
        case canWrite = "can_write"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.peer = try container.decode(Peer.self, forKey: .peer)
        self.lastMessageId = try container.decode(Int.self, forKey: .lastMessageId)
        self.inRead = try container.decode(Int.self, forKey: .inRead)
        self.outRead = try container.decode(Int.self, forKey: .outRead)
        self.isMarkedUnread = try container.decode(Bool.self, forKey: .isMarkedUnread)
        self.important = try container.decode(Bool.self, forKey: .important)
        self.canWrite = try container.decode(CanWrite.self, forKey: .canWrite)
    }
    
    init() {
        self.peer = Peer()
        self.lastMessageId = 1
        self.inRead = 1
        self.outRead = 1
        self.isMarkedUnread = false
        self.important = false
        self.canWrite = CanWrite()
    }
}
