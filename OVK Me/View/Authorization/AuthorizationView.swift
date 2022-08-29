//
//  AuthorizationView.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 18.07.2022.
//

import SwiftUI

struct AuthorizationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject private var viewModel = TokenModelData()
    @State private var prefs = Prefs()
    @State private var showingListInstances = false
    
    @Binding var isLogged: Bool
    
    var body: some View {
        Form {
            VStack {
                Image(uiImage: GetAppIcon()).cornerRadius(15)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .listRowInsets(EdgeInsets())
            .background(Color(UIColor.systemGroupedBackground))
            
            Section {
                TextField("E-Mail", text: $email)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
            }
            
            Section {
                Button {
                    print("email = \(email).")
                    if (email == "" || password == "") {
                        self.viewModel.showErrorAlert.toggle()
                        self.viewModel.alertMessage = "Please enter your username and password"
                        return
                    } else if (prefs.APIDomain == nil) {
                        self.viewModel.showErrorAlert.toggle()
                        self.viewModel.alertMessage = "Please select a instance"
                        return
                    }
                    
                    viewModel.getToken(email: email, password: password)
                    
                    if !viewModel.token.accessToken.isEmpty {
                        isLogged.toggle()
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text("Login")
                        Spacer()
                    }
                }
            }
        
            Section {
                Button {
                    showingListInstances.toggle()
                } label: {
                    HStack {
                        Spacer()
                        Text((prefs.APIDomain == nil) ? "Select a instance" : "Instance: " + prefs.APIDomain!)
                        Spacer()
                    }
                }
            }
        }
        .confirmationDialog("Select a instance", isPresented: $showingListInstances) {
            Button("openvk.su (Main instance)") {
                prefs.APIDomain = "openvk.su"
            }
            Button("Mirror of openvk.su") {
                prefs.APIDomain = "openvk.uk"
            }
            Button("social.fetbuk.ru") {
                prefs.APIDomain = "social.fetbuk.ru"
            }
            Button("openvk.local") {
                prefs.APIDomain = "openvk.local"
            }
            Button("vepurovk.xyz") {
                prefs.APIDomain = "vepurovk.xyz"
            }.disabled(true)
        }
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.alertMessage))
        }
    }
}

extension AuthorizationView {
    func GetAppIcon() -> UIImage {
       var appIcon: UIImage! {
         guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String:Any],
         let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? [String:Any],
         let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? [String],
         let lastIcon = iconFiles.last else { return nil }
         return UIImage(named: lastIcon)
       }
      return appIcon
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView(isLogged: .constant(false))
    }
}
