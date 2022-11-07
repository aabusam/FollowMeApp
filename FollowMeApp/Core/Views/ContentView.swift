//
//  ContentView.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("log_status") var logStatus: Bool = false
    
    
    var body: some View {
        NavigationView{
            if logStatus{
                HomeView()
            }else{
                LoginView()
                    .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
