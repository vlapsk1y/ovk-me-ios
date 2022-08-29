//
//  QRCodeView.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 27.08.2022.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    @State private var prefs = Prefs()
    
    var body: some View {
        VStack {
            Image(uiImage: generateQRcode(url: "https://\(prefs.APIDomain!)/id\(String(describing: prefs.userId!))"))
                .interpolation(.none)
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            Text(prefs.APIDomain! + "/id" + String(prefs.userId!))
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
        }
    }
    
    func generateQRcode(url: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent){
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
    }
}
