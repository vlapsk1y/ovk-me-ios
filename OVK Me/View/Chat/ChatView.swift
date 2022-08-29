//
//  ChatView.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 21.08.2022.
//

import SwiftUI
import Introspect

struct ChatView: View {
    var peer: Peer
    @StateObject var viewModel = MessagesModelData()
    @State var uiTabarController: UITabBarController?
    @State private var message: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages, id: \.id) { message in
                    BubbleMessage(direction: (message.out == 1) ? .right : .left) {
                        Text(message.text)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    VStack (alignment: .leading) {
                        Text("First name and last name")
                        Text("Online").font(.footnote).foregroundColor(.gray)
                    }
                    Spacer()
                    AvatarUI()
                        .padding()
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    TextField("Type text..", text: $message)
                        .textFieldStyle(.roundedBorder)
                }
            }
        }
        .introspectTabBarController { (UITabBarController) in
            UITabBarController.tabBar.isHidden.toggle()
            uiTabarController = UITabBarController
        }
        .onAppear {
            viewModel.getHistory(userId: peer.id)
        }
        .onDisappear {
            uiTabarController?.tabBar.isHidden.toggle()
        }
    }
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(peer: Peer())
    }
}
