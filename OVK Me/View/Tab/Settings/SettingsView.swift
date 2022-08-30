//
//  SettingsView.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 18.07.2022.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = UsersModelData()
    @State private var prefs = Prefs()
    @Binding var isLogged: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink {
                        ProfileView(userId: prefs.userId!)
                    } label: {
                        AvatarUI(url: viewModel.users.first?.photo100)
                        VStack(alignment: .leading) {
                            Text("\(viewModel.users.first?.firstName ?? "") \(viewModel.users.first?.lastName ?? "")")
                            Text(viewModel.users.first?.status ?? "").font(.footnote).foregroundColor(.gray)
                        }
                    }
                                   
                    NavigationLink {
                        QRCodeView()
                    } label: {
                        Text("Share QR-Code")
                    }
                } footer: {
                    Text("Your profile in " + (prefs.APIDomain ?? "openvk.su"))
                }
                
                Section {
                    NavigationLink(destination: NavigationLazyView(AboutInstanceView())) {
                        Text("About the instance")
                    }
                }
                
                Section {
                    Button("Log out") {
                        UserDefaults.standard.removeObject(forKey: "access_token")
                        isLogged.toggle()
                    }.foregroundColor(Color.red)
                }
                
                Section { } footer: {
                    Text("\(Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String), version: \(Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String), codename: \(Bundle.main.infoDictionary!["CFBundleVersion"] as! String)")
                }
            }.navigationTitle("Settings")
                .onAppear {
                    viewModel.get(user_ids: String(prefs.userId!), fields: "photo_100,status")
                }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isLogged: .constant(true))
    }
}
