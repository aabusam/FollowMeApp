//
//  ContentView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/6/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    @AppStorage("log_status") var logStatus: Bool = false
    
    var body: some View {
        NavigationView{
            if logStatus{
                HomeView(viewModel: viewModel)
                    .navigationBarHidden(true)
            }else{
                LoginView(viewModel: viewModel)
                    .navigationBarHidden(true)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: LoginViewModel(), logStatus:false)
    }
}


