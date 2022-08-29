//
//  ContentView.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 20.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = tab.messenger
    @StateObject private var accountModel = AccountModelData()
    
    enum tab {
        case friends
        case messenger
        case settings
    }
    
    var body: some View {
        TabView(selection: $selection) {
            FriendsView(countRequestsToFriends: $accountModel.counters.friends).tabItem {
                Text("Friends")
                Image(systemName: "person.2")
            }.tag(tab.friends).backport.badge(self.accountModel.counters.friends)
            MessengerView().tabItem {
                Text("Messages")
                Image(systemName: "message")
            }.tag(tab.messenger).backport.badge(self.accountModel.counters.messages)
            SettingsView().tabItem {
                Text("Settings")
                Image(systemName: "gear")
            }.tag(tab.settings)
        }.onAppear {
            self.accountModel.getCounters()
            self.accountModel.setOnline()
        }
    }
}   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

