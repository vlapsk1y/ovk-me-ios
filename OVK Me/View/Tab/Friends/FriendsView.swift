//
//  FriendsView.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 18.07.2022.
//

import SwiftUI

struct FriendsView: View {
    @StateObject private var viewModel = FriendsModelData()
    @Binding var countRequestsToFriends: Int
    @State private var prefs = Prefs()
    @State private var ShowRequests: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List {
                        if countRequestsToFriends > 0 {
                            NavigationLink("Count requests to friends: \(countRequestsToFriends)") {
                                ListRequestsToFriendsView(countRequests: $countRequestsToFriends)
                            }
                        }
                        ForEach(viewModel.friends, id: \.id) { user in
                            FriendRow(friend: user).swipeActions {
                                Button("Delete") {
                                    viewModel.delete(userId: user.id)
                                }
                                .tint(.red)
                            }
                        }
                    }.listStyle(.inset)
                        .navigationTitle("Friends")
                        .refreshable {
                            viewModel.isLoading.toggle()
                            viewModel.friends.removeAll()
                            viewModel.getFriends(userId: prefs.userId!)
                        }
                }
            }
        }
        .refreshable {
            viewModel.isLoading.toggle()
            viewModel.friends.removeAll()
            viewModel.getFriends(userId: prefs.userId!)
        }
        .onAppear {
            if (viewModel.friends.isEmpty) {
                viewModel.getFriends(userId: prefs.userId!)
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(countRequestsToFriends: .constant(1))
    }
}
