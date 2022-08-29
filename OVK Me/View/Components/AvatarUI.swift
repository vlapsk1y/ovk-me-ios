//
//  AvatarUI.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 14.08.2022.
//

import SwiftUI
import Foundation

struct AvatarUI: View {
    var url: String?
    
    var body: some View {
        AsyncImage(url: URL(string: url ?? "https://\(Prefs().APIDomain ?? "openvk.su")/assets/packages/static/openvk/img/camera_200.png")) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 50, height: 50)
        .clipShape(Circle())
    }
}

struct AvatarUI_Previews: PreviewProvider {
    static var previews: some View {
        AvatarUI()
    }
}
