//
//  BubbleMessage.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 24.08.2022.
//

import SwiftUI

struct BubbleMessage<Content>: View where Content: View {
    
    let direction: ChatBubbleShape.Direction
    let content: () -> Content
    init(direction: ChatBubbleShape.Direction, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.direction = direction
    }
    
    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }
            content().clipShape(ChatBubbleShape(direction: direction))
            if direction == .left {
                Spacer()
            }
        }.padding([(direction == .left) ? .leading : .trailing, .top, .bottom], 20)
            .padding((direction == .right) ? .leading : .trailing, 50)
    }
}

struct BubbleMessage_Previews: PreviewProvider {
    static var previews: some View {
        BubbleMessage(direction: .right) {
            Text("TEST")
        }
    }
}
