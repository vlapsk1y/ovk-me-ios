//
//  Message.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 19.08.2022.
//

import Foundation

struct Chat: Decodable {
    let conversation: Conversation
    let lastMessage: Message
    
    enum CodingKeys: String, CodingKey {
        case conversation
        case lastMessage = "last_message"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.conversation = try container.decode(Conversation.self, forKey: .conversation)
        self.lastMessage = try container.decode(Message.self, forKey: .lastMessage)
    }
    
    init() {
        self.conversation = Conversation()
        self.lastMessage = Message()
    }
}
