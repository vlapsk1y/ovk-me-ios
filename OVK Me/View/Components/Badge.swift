//
//  Badge.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 14.08.2022.
//

import SwiftUI

struct Badge: View {
    var count: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.clear
            Text(String(count))
                .font(.system(size: 16))
                .padding(5)
                .background(Color.red)
                .clipShape(Circle())
            // custom positioning in the top-right corner
                .alignmentGuide(.top) { $0[.bottom] }
                .alignmentGuide(.trailing) { $0[.trailing] - $0.width * 0.25 }
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge(count: 1)
    }
}
