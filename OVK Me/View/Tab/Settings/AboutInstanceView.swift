//
//  AboutInstanceView.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 27.08.2022.
//

import SwiftUI

struct AboutInstanceView: View {
    @StateObject private var viewModel = InstanceModelData()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView().onAppear {
                    if viewModel.isLoading {
                        viewModel.getVersion()
                        viewModel.getAboutInstance()
                    }
                }
            } else {
                List {
                    Section {
                        Text("Users")
                            .badge(viewModel.aboutInstance.statistics.usersCount)
                        Text("Online users")
                            .badge(viewModel.aboutInstance.statistics.onlineUsersCount)
                        Text("Active users")
                            .badge(viewModel.aboutInstance.statistics.activeUsersCount)
                        Text("Groups")
                            .badge(viewModel.aboutInstance.statistics.groupsCount)
                        Text("Wall posts")
                            .badge(viewModel.aboutInstance.statistics.wallPostsCount)
                    } header: {
                        Text("statistics")
                    }
                    
                    Section {
                        ForEach(viewModel.aboutInstance.administrators.profiles, id: \.id) { admin in
                            FriendRow(friend: admin)
                        }
                    } header: {
                        Text("administrators")
                    }
                    
                    Section {
                        ForEach(viewModel.aboutInstance.links.items, id: \.self) { link in
                            Button(link.name) {
                                UIApplication.shared.open(URL(string: link.url)!)
                            }
                        }
                    } header: {
                        Text("Links")
                    }
                    
                    Section {
                        
                    } footer: {
                        Text(viewModel.version)
                    }
                }.navigationBarTitle("", displayMode: .inline)
            }
        }
    }
}

struct AboutInstanceView_Previews: PreviewProvider {
    static var previews: some View {
        AboutInstanceView()
    }
}
