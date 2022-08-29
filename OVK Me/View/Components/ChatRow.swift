//
//  ChatRow.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 19.08.2022.
//

import SwiftUI

struct ChatRow: View {
    var chat: Chat
    var user: User
    
    var body: some View {
        HStack {
            AvatarUI(url: user.photo100)
            VStack(alignment: .leading) {
                HStack {
                    Text(user.firstName)
                    Text(user.lastName)
                }
                Text(chat.lastMessage.text).font(.footnote).foregroundColor(.gray).lineLimit(1)
            }
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat(), user: User())
    }
}
