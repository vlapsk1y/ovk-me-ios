//
//  MessengerView.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 18.07.2022.
//

import SwiftUI
import Introspect

struct MessengerView: View {
    @StateObject var viewModel = MessagesModelData()
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.conversations, id: \.conversation.peer.id) { chat in
                        NavigationLink(destination: ChatView(peer: chat.conversation.peer)) {
                            ChatRow(chat: chat, user: viewModel.profiles.filter { $0.id == chat.conversation.peer.id }.first!)
                        }
                    }.listStyle(.inset)
                }
            }.navigationTitle("Messages")
                .refreshable {
                    viewModel.isLoading.toggle()
                    viewModel.conversations.removeAll()
                    viewModel.profiles.removeAll()
                    viewModel.getConversations()
                }
        }
        .onAppear {
            if viewModel.conversations.isEmpty {
                viewModel.getConversations()
            }
        }
    }
}

struct MessengerView_Previews: PreviewProvider {
    static var previews: some View {
        MessengerView()
    }
}
