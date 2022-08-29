//
//  NavigationLazyView.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 17.08.2022.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
