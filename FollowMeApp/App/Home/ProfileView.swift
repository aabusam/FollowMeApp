//
//  ProfileView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/26/22.
//

import SwiftUI
import Firebase
import CodeScanner

struct ProfileView: View {
    
    @EnvironmentObject var locationSearchViewModel: LocationSearchViewModel
    
    @State var name:String
    @State var carModel:String
    @State var userId:String
    @Binding var mapViewState:MapViewState
    
    var body: some View {
        VStack{
            
            HStack{
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 40, height: 40)
                
                VStack{
                    Text(name)
                    Text(carModel)
                }
                .font(.body)
            }.padding()
            
            if userId != ""{
                QRCodeView(url: userId)
                    .padding()
            }else{
                Image(systemName: "x.square")
                    .padding()
            }
            
            QRCodeScanner(mapViewState: $mapViewState)
            
        }
        .padding()
        .background(Color(.white))
        
    }
        
}


struct QRCodeScanner: View {
    
    @EnvironmentObject var locationSearchViewModel: LocationSearchViewModel
    
    @State var isPresentingScanner = false
    @State var scannedCode: String = ""
    
    @Binding var mapViewState:MapViewState
    
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr]) { result in
                if case let .success(code) = result {
                    
                    self.scannedCode = code.string
                    locationSearchViewModel.userId = code.string
                    self.isPresentingScanner = false

                }
            }
    }
    
    var body: some View {
        VStack{
            Text((scannedCode != "") ? "Following Abdallah !" : "Scan User's ID to Start Following" )
            Button("Scan QR Code"){
                self.isPresentingScanner = true
                
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
            if scannedCode != "" {
                Button {
                    
                    if let id = locationSearchViewModel.userId{
                        locationSearchViewModel.getUserLocation(userId: id)
                        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
                            locationSearchViewModel.getUserLocation(userId: id)
                            
//                            if locationSearchViewModel.showProfileView == false {
//                                timer.invalidate()
//                            }
                        }
                        
                        locationSearchViewModel.showProfileView.toggle()
                        mapViewState = .isFollowing
                    }
                  
                } label: {
                    Text("follow Abdallah ?")
                }

            }
            
        }
    }
}

