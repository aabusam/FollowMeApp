//
//  File.swift
//  QRScanner
//
//  Created by Abdallah Abu Samaha on 11/22/22.
//

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View{
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var url: String
    
    var body: some View{
        Image(uiImage: genrateQRCodeImage(url))
            .interpolation(.none)
            .resizable()
            .frame(width: 120, height: 120, alignment: .center)
    }
    
    func genrateQRCodeImage(_ url: String) -> UIImage{
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let qrCodeImage = filter.outputImage{
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent){
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
            return UIImage(systemName:"xmark") ?? UIImage()
    }
}


