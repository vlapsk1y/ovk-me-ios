//
//  OVK_MeApp.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 20.07.2022.
//

import SwiftUI

@main
struct OVK_MeApp: App {
    @State var isLogged = Prefs().APIDomain != nil
    
    var body: some Scene {
        WindowGroup {
            if (isLogged) {
                ContentView(isLogged: $isLogged)
            } else {
                AuthorizationView(isLogged: $isLogged)
            }
        }
    }
}
