//
//  LastMessage.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 19.08.2022.
//

import Foundation

struct Message: Decodable, Hashable {
    let id: Int
    let userId: Int
    let fromId: Int
    let date: Int64
    let readState: Int
    let out: Int
    let title: String
    let body: String
    let text: String
    //let attachments
    //let fwdMessages
    let emoji: Bool
    let important: Bool
    let deleted: Int
    
    enum CodingKeys: String, CodingKey {
        case id, date, out, title, body, text, emoji, important, deleted
        case userId = "user_id"
        case fromId = "from_id"
        case readState = "read_state"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.userId = try container.decode(Int.self, forKey: .userId)
        self.fromId = try container.decode(Int.self, forKey: .fromId)
        self.date = try container.decode(Int64.self, forKey: .date)
        self.readState = try container.decode(Int.self, forKey: .readState)
        self.out = try container.decode(Int.self, forKey: .out)
        self.title = try container.decode(String.self, forKey: .title)
        self.body = try container.decode(String.self, forKey: .body)
        self.text = try container.decode(String.self, forKey: .text)
        self.emoji = try container.decode(Bool.self, forKey: .emoji)
        self.important = try container.decode(Bool.self, forKey: .important)
        self.deleted = try container.decode(Int.self, forKey: .deleted)
    }
    
    init() {
        self.id = 1
        self.userId = 1
        self.fromId = 2
        self.date = 0
        self.readState = 1
        self.out = 1
        self.title = "title"
        self.text = "text"
        self.body = "body"
        self.emoji = true
        self.important = true
        self.deleted = 0
    }
}
