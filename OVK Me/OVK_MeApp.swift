//
//  OVK_MeApp.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 20.07.2022.
//

import SwiftUI

@main
struct OVK_MeApp: App {
    @State var isLogged = UserDefaults.standard.string(forKey: "access_token") != nil
    
    var body: some Scene {
        WindowGroup {
            if (isLogged) {
                ContentView()
            } else {
                AuthorizationView(isLogged: $isLogged)
            }
        }
    }
}
