//
//  ListRequestsToFriendsView.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 13.08.2022.
//

import SwiftUI

struct ListRequestsToFriendsView: View {
    @Binding var countRequests: Int
    @StateObject private var viewModel = FriendsModelData()
    
    var body: some View {
        VStack {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.friends, id: \.id) { user in
                        FriendRow(friend: user).swipeActions {
                            Button("Add") {
                                viewModel.add(userId: user.id)
                                countRequests -= 1
                            }
                            .tint(.green)
                        }
                    }.listStyle(.inset)
                }
            }
        }.navigationBarTitle("", displayMode: .inline)
        .onAppear {
            if (viewModel.friends.isEmpty) {
                viewModel.getRequests()
            }
        }
    }
}

struct ListRequestsToFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        ListRequestsToFriendsView(countRequests: .constant(1))
    }
}
