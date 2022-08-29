//
//  FriendRow.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 31.07.2022.
//

import SwiftUI

struct FriendRow: View {
    var friend: User
    
    var body: some View {
        HStack {
            AvatarUI(url: friend.photo100)
            VStack(alignment: .leading) {
                Text(friend.firstName + " " + friend.lastName)
                HStack {
                    if let online = friend.online {
                        Text((online == 1) ? "Online" : "Offline").font(.footnote).foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

struct FriendRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FriendRow(friend: User())
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
