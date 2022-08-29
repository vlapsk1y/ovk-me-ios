//
//  ProfileView.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 12.08.2022.
//

import SwiftUI

struct ProfileView: View {
    @State var userId: Int
    @StateObject private var viewModel = UsersModelData()
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
                    .onAppear {
                        viewModel.get(user_ids: String(userId), fields: "")
                    }
            } else {
                ScrollView {
                    Section {
                        
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userId: 1)
    }
}
