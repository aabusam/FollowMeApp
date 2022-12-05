//
//  LogOutButton.swift
//  FollowMeApp
//
//  Created by Abdallah Abu Samaha on 11/6/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LogOutButton: View {
    
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        Button {
            
            try? Auth.auth().signOut()
            viewModel.logStatus = false
            }
        label: {
            Text("Logout")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black))
        }
        .padding(.horizontal)
        
    }
}

